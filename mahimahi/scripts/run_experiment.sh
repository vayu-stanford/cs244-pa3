#!/usr/bin/env bash
SOURCE=$1
# time to wait until starting direct dl
WAIT_TIME=$2
# time to wait after direct dl has started, before killing it 
KILL_TIME=$3

case $SOURCE in 
	"vimeo")
		URL='https://vimeo.com/93003441'
		SOURCE=vimeo;; 
	"youtube")
		URL='https://www.youtube.com/watch?v=iNJdPyoqt8U'
		SOURCE=youtube;;
	"local")
		URL='https://www.youtube.com/watch?v=iNJdPyoqt8U'
		SOURCE=local;;
	*) echo "Argument not recognized...exiting"
		exit -1;;
esac

## Setup

echo "Cleaning up old data and log files..."
rm -f data/${SOURCE}*
rm -f logs/${SOURCE}*
rm -f control/*

sleep 1

./scripts/generate_auxillary_data_${SOURCE}.sh ${URL}
./scripts/current_time.py > data/${SOURCE}_start_time

BROWSER_LOG_FILE="logs/${SOURCE}_client.raw.log"
DL_LOG_FILE="logs/${SOURCE}_direct_dl.raw.log"

sleep 1

# Run the experiment
echo Starting browser connection to ${URL}
mm-link ./traces/unlimited.trace ./traces/unlimited.trace --downlink-log="${BROWSER_LOG_FILE}" --meter-downlink -- ./scripts/run_firefox.sh ${SOURCE} ${URL} &
BROWSER_PID=$!

sleep 1

mm-link ./traces/unlimited.trace ./traces/unlimited.trace --meter-downlink --downlink-log="${DL_LOG_FILE}" -- ./scripts/direct_dl.sh ${URL} ${WAIT_TIME} ${KILL_TIME} ${SOURCE} &
DIRECT_DL_PID=$!

wait $BROWSER_PID
wait $DIRECT_DL_PID

## Check files

echo 'Done!'
if [ -f control/ff_failure ]; then
	echo "Browser logged failure...please examine output and rerun experiment"
	exit -1
fi

if [ -f control/dl_failure ]; then
	echo "Download logged failure...please examine output and rerun experiment"
	exit -1
fi

echo 'Checking data files......'
for file in data/${SOURCE}.har data/${SOURCE}_rates data/${SOURCE}_start_time ${BROWSER_LOG_FILE} ${DL_LOG_FILE} ; do
	echo "Checking existence of file ${file}" 
	if [ ! -f ${file} ]; then
		echo "Could not find ${file}. Please execute ./scripts/cleanup.sh, then rerun experiment" 
		echo "Exiting..."
		exit -1
	fi
done

echo 'Generating graphs...'
./scripts/generate_graphs.sh ${SOURCE}
