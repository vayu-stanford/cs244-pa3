URL=$2
echo Starting browser connection to ${URL}
firefox --devtools --private-window ${URL}  &> /dev/null 
