#!/usr/bin/env python
import json
import sys
import dateutil.parser

f = open(sys.argv[1])
js = json.load(f)
firstdt = None
for j in js:
    if j: 
        dt = dateutil.parser.parse(j["time"])
        if not firstdt:
            firstdt = dt
        print (dt-firstdt).total_seconds(), j["responseSize"]
