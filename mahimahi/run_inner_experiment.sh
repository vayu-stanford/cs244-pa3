URL='https://vimeo.com/217874316'
echo Starting browser connection to ${URL}
mm-meter --meter-downlink abrowser  ${URL} &> /dev/null &
sleep 60
echo Starting long lived tcp connection to download video at ${URL}
mm-meter --meter-downlink youtube-dl ${URL} &> /dev/null &
