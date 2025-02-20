#!/bin/bash

# File containing car data
DATA_FILE="car_data.txt"


prev_timestamp=""
stops=0
car_moving=true


while read -r line; do
    
    timestamp=$(echo "$line" | awk '{print $1, $2}')
    speed=$(echo "$line" | awk '{print $3}')

    # If speed is zero, mark the car as stopped
    if [ -n "$speed" ] && [ "$speed" -eq 0 ]; then
        
        prev_timestamp="$timestamp"
        continue
	# Skip this instance as the speed is zero
    fi

   
    if [ -z "$prev_timestamp" ]; then
        prev_timestamp="$timestamp"
        car_moving=true
        continue
    fi

    # Convert timestamps to seconds and find the duration it stopped
    prev_seconds=$(date -d "$prev_timestamp" +%s)
    current_seconds=$(date -d "$timestamp" +%s)
    time_diff=$((current_seconds - prev_seconds))

    # Check if time difference is more than  60 seconds and if car was previously moving
    if [ "$time_diff" -gt 60 ] && [ "$car_moving" == true ]; then
        ((stops++))
        car_moving=false
    fi

    # Reset car_moving to true for the next line
    car_moving=true
    prev_timestamp="$timestamp"

done < "$DATA_FILE"

echo "The car has stopped $stops times."

