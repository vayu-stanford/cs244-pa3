#!/usr/bin/env bash
echo 'Waiting to start direct download'
sleep ${2}
echo 'Starting direct download'
youtube-dl "${1}" -o /dev/null &> /dev/null
