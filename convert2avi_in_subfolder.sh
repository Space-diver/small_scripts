#!/bin/bash

# This bash script converts mkv files in subfolers to avi files

# The folder that contains subfolders in which the .mkv files are stored.
input_dir="base_folder/"

# Function to convert video
convert_video() {
    file="$1"
    output_dir="$2"
    filename=$(basename "$file" .mkv)
    output_file="${output_dir}/${filename}.avi"
    ffmpeg -i "$file" -an "$output_file"
}

export -f convert_video

# Iterate over each subdirectory
find "$input_dir" -type d | while read -r subdir; do
    relative_subdir="${subdir#$input_dir}"
    cd "$subdir"
    
    output_subdir="./avi"
    
    mkdir -p "$output_subdir"
    
    # Convert videos in the current subdirectory
    find "$subdir" -maxdepth 1 -name '*.mkv' -print0 | parallel -0 convert_video '{}' "$output_subdir"
done
