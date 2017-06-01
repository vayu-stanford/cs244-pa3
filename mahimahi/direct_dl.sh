#!/usr/bin/env bash
set -e
echo 'Waiting to start direct download'
sleep ${2}
echo 'Starting direct download'
# youtube-dl "${1}" -o /dev/null/ &> /dev/null
ping -c1 stanford.edu
youtube-dl --no-continue --no-cache-dir "${1}" -o /tmp/ > /dev/null
