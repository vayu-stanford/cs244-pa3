#!/usr/bin/env bash
mkdir -p data
mm-link traces/4mbps_trace  traces/5mbps_trace --downlink-queue=droptail --downlink-queue-args="bytes=15000" --meter-downlink
