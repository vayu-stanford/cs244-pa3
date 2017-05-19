URL='https://vimeo.com/217874316'
SOURCE=vimeo
WAIT_TIME=40
#URL='https://www.youtube.com/watch?v=RDfjXj5EGqI'
echo Starting browser connection to ${URL}
mm-link ./traces/5mbps_trace ./traces/5mbps_trace --downlink-log="logs/${SOURCE}_client.raw.log" --meter-downlink -- firefox  --devtools ${URL}  &> /dev/null &
mm-link ./traces/5mbps_trace ./traces/5mbps_trace --meter-downlink --downlink-log="logs/${SOURCE}_direct_dl.raw.log" -- ./direct_dl.sh ${URL} ${WAIT_TIME} &
