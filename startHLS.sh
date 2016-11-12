#!/bin/bash

SOURCE="huamao?fmt=x264_700k_flv&cpid=creditease"
CP="creditease"

check_ffmpeg(){

CHECK=`ps -ef|grep -v "grep"|grep -c hls_time`
DATE=`date +"%Y/%m/%d %H:%M:%S"`

if [ $CHECK -eq 0 ]
then
echo "$DATE Restart FFMPEG" >>/tmp/check.log
nohup /opt/znfz/ffmpeg -i "http://127.0.0.1/live/${SOURCE}" -c copy -bsf:v h264_mp4toannexb -f hls -hls_time 10 -hls_list_size 10 -hls_wrap 10 -hls_segment_filename "/SO/gui/live/${CP}/file%02d.ts" /SO/gui/live/${CP}/index.m3u8 > /dev/null &
sleep 10
else
sleep 10
fi
}

while true
do
check_ffmpeg
done

exit  0
