#!/bin/bash

SOURCE="online_conference?fmt=x264_700k_mpegts&cpid=creditease"
PATH="creditease"

/usr/bin/nohup /opt/znfz/ffmpeg -i "http://127.0.0.1/live/${SOURCE}" -c copy -f hls -hls_time 10 -hls_list_size 10 -hls_wrap 10 -hls_segment_filename /SO/gui/live/${PATH}/file%02d.ts /SO/gui/live/${PATH}/index.m3u8 > /dev/null &

exit 0
