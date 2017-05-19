#!/usr/bin/env python
import json
import sys
import dateutil.parser

SECS_PER_SEGMENT=4.0 # this is a guess based on seeing 15 segments at 60 seconds

time_file = open('data/vimeo_start_time')
start_str = time_file.read()
firstdt = (dateutil.parser.parse(start_str))
time_file.close()

f = open(sys.argv[1])
js = json.load(f)
for j in js:
    if j: 
        dt = dateutil.parser.parse(j["time"])
        print (dt-firstdt).total_seconds(), float(j["responseSize"])*8/1000/SECS_PER_SEGMENT # convert bytes to kbps
f.close()
