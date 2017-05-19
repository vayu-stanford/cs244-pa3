#!/usr/bin/env python
import json
import sys
import dateutil.parser

SECS_PER_SEGMENT=4.0

f = open(sys.argv[1])
js = json.load(f)
firstdt = None
for j in js:
    if j: 
        dt = dateutil.parser.parse(j["time"])
        if not firstdt:
            firstdt = dt
        print (dt-firstdt).total_seconds(), float(j["responseSize"])*8/1000/SECS_PER_SEGMENT # convert bytes to kbps
