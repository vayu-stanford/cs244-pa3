#!/usr/bin/env bash
set -e
FILENAME=${1}
./filters/vimeo_filter "data/${1}.har" > "data/${1}.json"
./filters/convert_playback_trace.py "data/${1}.json" > "data/${1}_playback_rate.data"
gnuplot < ./graph/rate_plot.input > "figures/${1}_playback_rate.png"
