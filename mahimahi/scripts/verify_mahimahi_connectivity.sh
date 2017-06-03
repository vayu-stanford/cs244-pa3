#!/usr/bin/env bash
ping -c1 stanford.edu > /dev/null
STATUS=$?
if [ $STATUS -ne 0 ]; then
	echo "No internet connectivity within mahimahi shell."
else
	echo "Experiment environment set up. You should see a throughput graph"
fi

