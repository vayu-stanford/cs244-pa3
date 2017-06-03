#!/usr/bin/env bash
set -e
rm -f ./graph/${SOURCE}_combined_plot.input
SOURCE=${1}
# playback graph
./filters/convert_har_to_json_${SOURCE}.sh "data/${SOURCE}.har" > "data/${SOURCE}.json"
./filters/convert_playback_trace_${SOURCE}.py "data/${SOURCE}.json" > "data/${SOURCE}_playback_rate.data"


./filters/convert_mahimahi_to_graph_input.py ./logs/${SOURCE}_client.raw.log > data/${SOURCE}_client_throughput.data
./filters/convert_mahimahi_to_graph_input.py ./logs/${SOURCE}_direct_dl.raw.log > data/${SOURCE}_dl_throughput.data

cp ./graph/standard.input.template ./graph/${SOURCE}_combined_plot.input 

./filters/generate_vertical_line_commands.py ${SOURCE} >>  ./graph/${SOURCE}_combined_plot.input 

cat ./graph/${SOURCE}_combined_plot.input.template >> ./graph/${SOURCE}_combined_plot.input

gnuplot < ./graph/${SOURCE}_combined_plot.input 
