#!/bin/bash

# This script converts the .mkv files to avi files in parallel.
# It is much faster than doing it manually.
input_dir="folder/"

cd "$input_dir"

output_dir="./avi"

mkdir -p "$output_dir"

# Function to convert video
convert_video() {
    file="$1"
    output_dir="$2"
    filename=$(basename "$file" .mkv)
    output_file="${output_dir}/${filename}.avi"
    ffmpeg -i "$file" -an "$output_file"
}

export -f convert_video

# Find all .mkv files and process them in parallel
find "$input_dir" -name '*.mkv' | parallel convert_video {} "$output_dir"
