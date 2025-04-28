#!/bin/bash

input_dir="$1"
output_dir="$2"


find "$input_dir" -type f | while read file; do
    filename=$(basename "$file")
    base="${filename%.*}"
    ext="${filename##*.}"

    dest="$output_dir/$filename"
    num=1

    while [ -e "$dest" ]; do
        dest="$output_dir/${base}${num}.${ext}"
        num=$((num + 1))
    done

    cp "$file" "$dest"
done