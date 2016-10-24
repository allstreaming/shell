#!/bin/bash

INPUT_PORT=(60002 60012 60022 60032 60042 60052)

while true
do
for i in ${INPUT_PORT[@]}
do
CHECK=`ps -ef|grep -v "grep"|grep -c "Re_$i"`
DATE=`date +"%Y-%d-%m_%H:%M:%S"`

if [ $CHECK -eq 0 ]
then
nohup /opt/ffmpeg/ffmpeg -i udp://224.0.0.1:${i}?timeout=500 -c copy -f mpegts /v01/Re_${i}_$DATE.ts >/dev/null &
fi
done
done
exit 0
