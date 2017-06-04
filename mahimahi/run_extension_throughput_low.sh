#!/usr/bin/env bash
WAIT_TIME=60
DL_KILL_TIME=80
case $1 in 
	"vimeo")
		SOURCE=vimeo;; 
	"youtube")
		SOURCE=youtube;;
	"local")
		SOURCE=local;;
	*) echo "Argument not recognized"
		echo "Accepted arguments are:"
		echo "vimeo"
		echo "youtube"
		echo "local"
		exit -1;;
esac
sudo sysctl -w net.ipv4.ip_forward=1
mkdir -p data
mkdir -p logs
mm-link traces/3mbps_trace  traces/3mbps_trace --meter-downlink -- ./scripts/run_experiment.sh "${SOURCE}" ${WAIT_TIME} ${DL_KILL_TIME}
