# live

Simple scripts to concat audio tracks, loop a video, render combined output, and stream it live via RTMP using FFmpeg.

## Features

- Concatenate multiple MP3 audio files into one AAC audio track
- Loop a video file to match audio duration
- Render combined video+audio output in 1080p
- Stream video live to YouTube RTMP server

## Usage

### Render combined video+audio

```bash
./render.sh /path/to/mp3_dir video.mp4 output.mp4
````

* `mp3_dir` — directory containing `.mp3` audio files to concat
* `video.mp4` — video file to loop
* `output.mp4` — output rendered video file (1080p forced)

### Stream video live to YouTube

```bash
./stream.sh video.mp4 STREAM_KEY
```

* `video.mp4` — video file to stream (can be output of `render.sh` or any video)
* `STREAM_KEY` — YouTube live stream key

## How it works

* `render.sh` concatenates `.mp3` files from directory, encodes to AAC audio.m4a
* Measures audio duration, loops video input to match audio length
* Outputs combined video+audio in 1080p using libx264 and AAC
* `stream.sh` streams video over RTMP to YouTube live endpoint

## Notes

* Video scaling uses Lanczos for high-quality resizing
* Audio bitrate fixed to 192k AAC
* Temporary files cleaned after rendering
