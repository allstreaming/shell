#!/bin/bash

INPUT_PORT=(60001 60003 60005)
MULTCAST_IP=224.0.0.1

for i in ${INPUT_PORT[@]}
  do
  OUTPUT_PORT=$(($i+1))
  /opt/ffmpeg -i udp://127.0.0.1:$i -c copy -f mpegts udp://${MULTCAST_IP}:${OUTPUT_PORT}?pkt_size=1316
  done
exit 0
