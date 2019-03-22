#!/usr/bin/env bash

# Pass this script the directory containing the video files.
# It will create an empty .mp4 file with the last watched episode in the title.

if [[ $# -ne 1 ]]; then
  echo You must pass one directory at a time to this script.
  exit 1
fi

rm -f $1/0_last_episode-*

lastep=$(ls -pu $1 | grep -v / | head -n 1)

printf "%b" '\x47' > "$1/0_last_episode-$lastep.mp4"
