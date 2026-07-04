#!/bin/bash

# Check if prefix argument is present; If not, show error & exit
if [ -z "$1" ]; then
  echo "Error: Prefix argument is missing." >&2
  echo "Usage: $0 <prefix>" >&2
  exit 1
fi

# Check if any matching files exist
file_count=$( (find ./*.txt | wc -l) 2> /dev/null )
if [[ $file_count == 0 ]]; then
  echo "Error: no .txt file are present in the current directory." >&2
  exit 1
fi

# Find and rename .txt files in current directory, prefixing names
for file in ./*.txt; do
  base=$(basename "$file")
  mv "$file" "./$1-$base"
done
