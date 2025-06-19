#!/bin/bash
# Usage: ./render.sh mp3_dir visual.mp4 output.mp4

TMP=$(mktemp)
for f in "$1"/*.mp3; do echo "file '$PWD/$f'" >> "$TMP"; done

ffmpeg -y -f concat -safe 0 -i "$TMP" \
  -af loudnorm \
  -c:a aac -b:a 192k audio.m4a
rm "$TMP"

DUR=$(ffprobe -v error -show_entries format=duration -of csv=p=0 audio.m4a)

ffmpeg -y -stream_loop -1 -i "$2" -i audio.m4a \
  -map 0:v -map 1:a -t "$DUR" \
  -vf "scale=1920:1080:flags=lanczos" \
  -c:v libx264 -preset fast -pix_fmt yuv420p -c:a aac "$3"

rm audio.m4a
