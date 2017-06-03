#!/usr/bin/env python
import json
import sys
import dateutil.parser

time_file = open('data/'+sys.argv[1]+'_start_time')
start_str = time_file.read()
firstdt = (dateutil.parser.parse(start_str))
time_file.close()

time_file = open('data/'+sys.argv[1]+'_direct_dl_start_time')
start_str = time_file.read()
ddlstartdt = (dateutil.parser.parse(start_str))
time_file.close()

time_file = open('data/'+sys.argv[1]+'_direct_dl_stop_time')
start_str = time_file.read()
ddlenddt = (dateutil.parser.parse(start_str))
time_file.close()

startline =  (ddlstartdt-firstdt).total_seconds()
endline = (ddlenddt-firstdt).total_seconds()
print "set arrow from %s, graph(0,0) to %s, graph(1,1) nohead dashtype 2" % (startline, startline)
print "set arrow from %s, graph(0,0) to %s, graph(1,1) nohead dashtype 2" % (endline, endline)
