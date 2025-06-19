#!/bin/bash
set -euo pipefail
[[ $# -eq 2 ]] || {
  echo "Usage: $0 video.mp4 STREAM_KEY"
  exit 1
}
trap 'echo "Stopping stream..."' INT

ffmpeg -re -stream_loop -1 -i "$1" -c copy -f flv "rtmp://a.rtmp.youtube.com/live2/$2"
