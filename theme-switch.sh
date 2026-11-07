#--------------------------------------------------------------
#Script that automatically changes plasma theme based on time
#--------------------------------------------------------------

#!/bin/bash

# ./theme-switch.sh with no arguments - auto
# ./theme-switch.sh dark - dark, manual
# ./theme-switch.sh light - light, manual

#You can adjust these parameters:
dark_from=20 #8PM
dark_until=6 #6AM
check_every=600 #seconds

#Set theme
apply_theme(){
    local mode="$1"
    if [ "$mode" = "dark" ]; then /usr/bin/plasma-apply-colorscheme BreezeDark
    else /usr/bin/plasma-apply-colorscheme BreezeLight
    fi
    echo "$(/usr/bin/date '+%Y-%m-%d %H:%M:%S') mode set: $mode"
}

#If argument given, apply the selected theme and exit
if [ "$1" = "dark" ]; then apply_theme "dark"
    exit 0
elif [ "$1" = "light" ]; then apply_theme "light"
    exit 0
fi

#Auto
sleep 10
while true; do hour=$(/usr/bin/date +%H)
    if [ "$hour" -ge $dark_from ] || [ "$hour" -lt $dark_until ]; 
    then wanted="BreezeDark"
    else wanted="BreezeLight"
    fi
    current=$(/usr/bin/kreadconfig6 --file kdeglobals --group General --key ColorScheme)
    if [ "$current" != "$wanted" ]; then /usr/bin/plasma-apply-colorscheme "$wanted"
        echo "$(/usr/bin/date '+%Y-%m-%d %H:%M:%S') theme changed to '$wanted'"
    else
        echo "$(/usr/bin/date '+%Y-%m-%d %H:%M:%S') theme correct ('$current'), nothing changed"
    fi
    sleep $check_every
done
