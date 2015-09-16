#!/bin/bash

SOURCE=$1
OUTPUT=$2

# There are two tipes of files:
# 1. Heads: Filename of the form gopr[head ID].mp4
# 2. Parts: Filename of the form gp[index][head ID].mp4

MP3IDX=1

# List heads
for HEADIDX in $(ls -1 "$SOURCE" | grep "gopr" | sed 's/gopr\([0-9]*\)\.mp4/\1/g' | sort -n)
do
# Convert to mp3 example: ffmpeg -i /mnt/hgfs/shared/2015-06-09/hero4silver2/gopr6097.mp4 -q:a 0 -map a /tmp/gopr6097.mp3
    VIDEO="${SOURCE}gopr${HEADIDX}.mp4"
    MP3="${OUTPUT}${MP3IDX}.mp3"
    MP3IDX=$(($MP3IDX + 1))
    ffmpeg -i "$VIDEO" -q:a 0 -map a $MP3

# Get list of parts
    for PARTIDX in $(ls -1 "$SOURCE" | grep "gp.*$HEADIDX.*" | sed "s/gp\([0-9]*\)${HEADIDX}\.mp4/\1/g" | sort -n)
    do
        VIDEO="${SOURCE}gp$PARTIDX$HEADIDX.mp4"
        MP3="${OUTPUT}${MP3IDX}.mp3"
        MP3IDX=$(($MP3IDX + 1))
        ffmpeg -i "$VIDEO" -q:a 0 -map a $MP3
    done
done

