#!/usr/bin/env bash
set -e
SOURCE=${1}
./filters/convert_har_to_json_${SOURCE}.sh "data/${SOURCE}.har" > "data/${SOURCE}.json"
./filters/convert_playback_trace_${SOURCE}.py "data/${SOURCE}.json" > "data/${SOURCE}_playback_rate.data"
gnuplot < ./graph/rate_plot.input > "figures/${SOURCE}_playback_rate.png"
