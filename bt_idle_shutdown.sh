#--------------------------------------------------------------------------
#Script that automatically disables bluetooth when no devices are connected
#--------------------------------------------------------------------------

#!/bin/bash

minutes_passed=0

#You can adjust these parameters as you want:
wait=10 #minutes
check_every=60 #seconds

while true; do
    #How many connected
    connected=$(bluetoothctl devices Connected | grep -c "Device" || echo 0)
    if [ "$connected" -gt 0 ]; then
        minutes_passed=0
        #echo "$(date +%H:%M): Connected devices: $connected, Bluetooth stays on" #Optional debug output
    else
        #No connected devices
        minutes_passed=$((minutes_passed + 1))
        #echo "$(date +%H:%M): No connected device till $minutes_passed minutes" #Optional debug output
        if [ "$minutes_passed" -ge "$wait" ]; then
            #echo "$(date +%H:%M); 10 minutes without connection, turning Bluetooth off" #Optional debug output
            bluetoothctl power off
            minutes_passed=0
        fi
    fi
    sleep $check_every
done
