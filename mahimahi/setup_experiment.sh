#!/usr/bin/env bash
mm-link traces/5mbps_trace  traces/5mbps_trace --downlink-queue=droptail --downlink-queue-args="bytes=15000" --meter-downlink
