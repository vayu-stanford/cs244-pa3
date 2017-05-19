#!/usr/bin/env bash
set -e
SOURCE=${1}
# playback graph
./filters/convert_har_to_json_${SOURCE}.sh "data/${SOURCE}.har" > "data/${SOURCE}.json"
./filters/convert_playback_trace_${SOURCE}.py "data/${SOURCE}.json" > "data/${SOURCE}_playback_rate.data"
gnuplot < ./graph/vimeo_rate_plot.input > "figures/${SOURCE}_playback_rate.png"


./filters/convert_mahimahi_to_graph_input.py ./logs/${SOURCE}_client.raw.log > data/${SOURCE}_client_throughput.data
./filters/convert_mahimahi_to_graph_input.py ./logs/${SOURCE}_direct_dl.raw.log > data/${SOURCE}_dl_throughput.data
gnuplot < ./graph/vimeo_throughput_plot.input > "figures/${SOURCE}_throughput.png"

gnuplot < ./graph/vimeo_combined_plot.input > "figures/${SOURCE}_combined.png"
