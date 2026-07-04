#!/bin/bash

# Check if location argument is present; If not, show error & exit
if [ -z "$1" ]; then
  echo "Error: Location argument is missing." >&2
  echo "Usage: $0 <location>" >&2
  exit 1
fi

for cmd in curl jq; do
  if ! (command -v $cmd &> /dev/null); then
    echo "Error: $cmd is required for this script, but not installed." >&2
    echo "Install it using your package manager, for example: sudo apt install $cmd" >&2
    exit 1
  fi
done

# Fetch weather info from wttr.is (wttr.in)
# https://github.com/chubin/wttr.in
res_json=$(curl -sf "https://wttr.is/${1// /+}?format=j1")

if [ $? -ne 0 ]; then
  echo "Error: Failed to fetch weather data for $1." >&2
  exit 1
fi

weather_desc=$(echo "$res_json" | jq -r '.current_condition[0].weatherDesc[0].value')
temp_c=$(echo "$res_json" | jq -r '.current_condition[0].temp_C')
temp_feels_like_c=$(echo "$res_json" | jq -r '.current_condition[0].FeelsLikeC')

# Print user friendly message with some data from the fetched JSON
echo "It's currently $weather_desc in $1 - $temp_c°C (feels like $temp_feels_like_c°C)."