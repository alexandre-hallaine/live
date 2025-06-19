#!/bin/bash
# Usage: ./stream.sh video.mp4 STREAM_KEY

ffmpeg -re -stream_loop -1 -i "$1" -c copy -f flv "rtmp://a.rtmp.youtube.com/live2/$2"
