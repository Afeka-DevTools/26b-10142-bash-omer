#!/bin/bash

# Check if extension argument is present; If not, show error & exit
if [ -z "$1" ]; then
  echo "Error: File extension argument is missing." >&2
  echo "Usage: $0 <ext>" >&2
  exit 1
fi

# `find` below already includes a dot, so the arg shouldn't start with one
if [[ $1 == .* ]]; then
  echo "Error: File extension argument should NOT start with a dot." >&2
  exit 1
fi

# Remove errors, like "no matches found" from output
RESULT=$( (find *.$1 | wc -l) 2> /dev/null )
echo "The current directory has $RESULT $1 file(s)."