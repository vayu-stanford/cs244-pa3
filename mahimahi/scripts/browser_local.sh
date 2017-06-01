#!/usr/bin/env bash
cd ../dash_js/
python -m SimpleHTTPServer &
firefox --devtools --private-window http://localhost:8000 &> /dev/null
kill %1
