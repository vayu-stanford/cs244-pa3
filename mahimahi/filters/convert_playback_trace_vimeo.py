#!/usr/bin/env python
import json
import sys
import dateutil.parser

SECS_PER_SEGMENT=4.0 # this is a guess based on seeing 15 segments at 60 seconds

time_file = open('data/vimeo_start_time')
start_str = time_file.read()
firstdt = (dateutil.parser.parse(start_str))
time_file.close()


ratemap = {}
r = open('data/vimeo_rates')
for line in r:
    tokens = line.split()
    identifier = tokens[0].split('-')[-1]
    rate = (tokens[5].rstrip('k,'))
    print tokens
    ratemap[identifier] = rate
r.close()

print ratemap


f = open(sys.argv[1])
js = json.load(f)
for j in js:
    if j: 
        dt = dateutil.parser.parse(j["time"])
        kbps =  ratemap[j["request"].split("/")[-3]]
        deduced_kbps = float(j["responseSize"])*8/1000/SECS_PER_SEGMENT # convert bytes to kbps
        print (dt-firstdt).total_seconds(), kbps
f.close()
