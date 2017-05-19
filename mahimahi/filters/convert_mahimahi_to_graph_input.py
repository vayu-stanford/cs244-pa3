#!/usr/bin/env python
import sys
f = open(sys.argv[1])

MIN_DELTA=200

previous_time = 0
num_bytes = 0
delta = 1
for line in f:
    tokens = line.split()
    if(tokens[0] != "#"  and tokens[1] == "-"):
        time = int(tokens[0])
        if time - previous_time > MIN_DELTA:
            num_kbits = num_bytes *8 / 1000.0
            kbps = num_kbits / (delta)
            print previous_time/1000.0, kbps
            delta = time - previous_time
            num_bytes = float(tokens[2])
            previous_time = time
        else:
            num_bytes += float(tokens[2])

num_kbits = num_bytes *8 / 1000.0
kbps = num_kbits / (delta)
print time/1000.0, kbps
