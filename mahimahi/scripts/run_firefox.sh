#!/usr/bin/env bash
SOURCE=$1
URL=$2
echo "Testing mahimahi connectivity for browser link"
ping -c1 stanford.edu &> /dev/null
MM_CONNECT_STATUS=$?

if [ $MM_CONNECT_STATUS -ne 0  ]; then
	echo "ERROR: no internet connectivity within mahimahi shell"
	echo "Please press CTRL+C, then execute ./scripts/cleanup.sh, then rerun experiment"
	touch control/ff_failure
	exit -1
fi

firefox  --devtools --private-window "${URL}"  &> /dev/null 
FF_PID=$!
wait $FF_PID

if [ ! -f data/${SOURCE}.har ]; then
	echo "ERROR: Could not find HAR file. Please make sure to save HAR file from firefox network tab before exiting the browser"
	touch control/ff_failure
fi
