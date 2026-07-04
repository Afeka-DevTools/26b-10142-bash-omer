#!/bin/bash

# Check if time argument is present; If not, show error & exit
if [ -z "$1" ]; then
  echo "Error: Time argument is missing." >&2
  echo "Usage: $0 HH:MM:SS" >&2
  exit 1
fi

TIME_FORMAT_REGEX="^([0-9]{2}):([0-9]{2}):([0-9]{2})$"

if [[ ! $1 =~ $TIME_FORMAT_REGEX ]]; then
  echo "Error: Time argument must match the format HH:MM:SS." >&2
  exit 1
fi

hours="${BASH_REMATCH[1]}"
mins="${BASH_REMATCH[2]}"
secs="${BASH_REMATCH[3]}"

while [[ ($secs -gt 0 || $mins -gt 0 || $hours -gt 0) ]]; do
  printf "\r%02d:%02d:%02d remaining." "$hours" "$mins" "$secs"
  sleep 1
  ((secs--))
  
  if [[ secs -lt 0 ]]; then
    ((mins--))
    secs=59
  fi
  
  if [[ mins -lt 0 ]]; then
    ((hours--))
    mins=59
  fi
done
printf "\rTime's up!         \n"