#URL='https://vimeo.com/217874316'
#SOURCE=vimeo
URL='https://www.youtube.com/watch?v=iNJdPyoqt8U'
SOURCE=youtube
WAIT_TIME=40
./generate_auxillary_data_${SOURCE}.sh ${URL}
./current_time.py > data/${SOURCE}_start_time
echo Starting browser connection to ${URL}
mm-link ./traces/5mbps_trace ./traces/5mbps_trace --downlink-log="logs/${SOURCE}_client.raw.log" --meter-downlink -- firefox  --devtools ${URL}  &> /dev/null &
mm-link ./traces/5mbps_trace ./traces/5mbps_trace --meter-downlink --downlink-log="logs/${SOURCE}_direct_dl.raw.log" -- ./direct_dl.sh ${URL} ${WAIT_TIME} &
