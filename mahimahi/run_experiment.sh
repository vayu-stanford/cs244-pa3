URL='https://vimeo.com/217874316'
#URL='https://www.youtube.com/watch?v=RDfjXj5EGqI'
echo Starting browser connection to ${URL}
mm-meter --meter-downlink -- firefox  --devtools ${URL} &> /dev/null &
sleep 60
echo Starting long lived tcp connection to download video at ${URL}
mm-meter --meter-downlink -- youtube-dl ${URL} -o /dev/null &> /dev/null &
