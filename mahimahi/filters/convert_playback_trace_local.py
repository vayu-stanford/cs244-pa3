#!/usr/bin/env python
import json
import sys
import dateutil.parser

SECS_PER_SEGMENT=4.0 # this is a guess based on seeing 15 segments at 60 seconds

time_file = open('data/local_start_time')
start_str = time_file.read()
firstdt = (dateutil.parser.parse(start_str))
time_file.close()


ratemap = {}
ratemap["1"]=500
ratemap["2"]=800
ratemap["3"]=500
ratemap["4"]=1400
ratemap["5"]=1700
ratemap["6"]=2000

f = open(sys.argv[1])
js = json.load(f)
for j in js:
    if j: 
        dt = dateutil.parser.parse(j["time"])
        kbps =  ratemap[j["request"].split("/")[-2]]
        print (dt-firstdt).total_seconds(), kbps
f.close()
