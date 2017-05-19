#!/usr/bin/env python
import json
import sys
import dateutil.parser

time_file = open('data/youtube_start_time')
start_str = time_file.read()
firstdt = (dateutil.parser.parse(start_str))
time_file.close()


ratemap = {}
r = open('data/youtube_rates')
for line in r:
    firstrawtoken = line.split(',')[0]
    tokens = firstrawtoken.split()
    identifier = tokens[0]
    rate = (tokens[-1].rstrip('k'))
    ratemap[identifier] = rate
r.close()


f = open(sys.argv[1])
js = json.load(f)
for j in js:
    if j: 
        dt = dateutil.parser.parse(j["time"])
        kbps = -1
        for kv in j["queryString"]:
            if kv["name"] == "itag":
                kbps =  ratemap[kv["value"]]
        print (dt-firstdt).total_seconds(), kbps
f.close()
