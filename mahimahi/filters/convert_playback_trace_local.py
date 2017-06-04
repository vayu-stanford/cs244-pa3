#!/usr/bin/env python
import json
import sys
import dateutil.parser

SECS_PER_SEGMENT=4.0 # this is a guess based on seeing 15 segments at 60 seconds

time_file = open('data/local_start_time')
start_str = time_file.read()
firstdt = (dateutil.parser.parse(start_str))
time_file.close()


divisor = 1024.0
ratemap = {}
ratemap["960x540p50"]= 2814440/divisor
ratemap["256x144p25"]= 158128/divisor
ratemap["704x396p50"]= 1572456/divisor
ratemap["1920x1080i25"]= 8060152/divisor
ratemap["512x288p25"]= 440664/divisor
ratemap["640x360p25"]= 166680/divisor
ratemap["384x216p25"]= 283320/divisor
ratemap["896x504p25"]= 1375216/divisor
ratemap["1280x720p50"]= 5072376/divisor
ratemap["704x396p25"]= 834352/divisor
ratemap["192x108p25"]= 88648/divisor
ratemap["448x252p25"]= 437856/divisor
ratemap["192x108p6_25"]= 31368/divisor

f = open(sys.argv[1])
js = json.load(f)
for j in js:
    if j: 
        dt = dateutil.parser.parse(j["time"])
        kbps =  ratemap[j["request"].split("/")[-2]]
        print (dt-firstdt).total_seconds(), kbps
f.close()
