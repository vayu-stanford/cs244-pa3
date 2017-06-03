#!/usr/bin/env bash
SOURCE=$4

echo 'Checking direct download mahimahi connectivity'
ping -c1 stanford.edu > /dev/null
MM_CONNECT_STATUS=$?
if [ $MM_CONNECT_STATUS -ne 0  ]; then
	echo "Error: no connectivity within mahimahi shell"
	echo "Please execute cleanup.sh, then rerun experiment"
	touch control/dl_failure
	exit -1
fi
echo 'Waiting to start direct download'
sleep ${2}
echo 'Starting direct download'
./scripts/current_time.py > data/${SOURCE}_direct_dl_start_time
youtube-dl --no-continue --no-cache-dir "${1}" -o '/tmp/%(title)s.%(ext)s' > /dev/null &
DL_PID=$!
echo "Waiting to ${3} seconds to kill dl"
sleep ${3}
echo 'Experiment time has elapsed...killing direct dl'
./scripts/current_time.py > data/${SOURCE}_direct_dl_stop_time
kill ${DL_PID}
