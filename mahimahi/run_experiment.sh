#URL='https://vimeo.com/93003441'
#SOURCE=vimeo

#URL='https://www.youtube.com/watch?v=iNJdPyoqt8U'
#SOURCE=youtube

# use youtube as url to generate competing flow for download for local for now until we host on cloud
# can't use localhost since python must run in mm-link which is downloading
URL='https://www.youtube.com/watch?v=iNJdPyoqt8U'
SOURCE=local

WAIT_TIME=40
./generate_auxillary_data_${SOURCE}.sh ${URL}
./current_time.py > data/${SOURCE}_start_time
echo Starting browser connection to ${URL}
#mm-link ./traces/unlimited.trace ./traces/unlimited.trace --downlink-log="logs/${SOURCE}_client.raw.log" --meter-downlink -- firefox  --devtools --private-window ${URL}  &> /dev/null &
mm-link ./traces/5mbps_trace ./traces/5mbps_trace --downlink-log="logs/${SOURCE}_client.raw.log" --meter-downlink -- ./scripts/browser_${SOURCE}.sh ${URL} &
mm-link ./traces/unlimited.trace ./traces/unlimited.trace --meter-downlink --downlink-log="logs/${SOURCE}_direct_dl.raw.log" -- ./direct_dl.sh ${URL} ${WAIT_TIME} &
