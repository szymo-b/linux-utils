# linux-utils
Some simple utilities and automation shell scripts I've written in Bash for Linux.

## Autostart
To keep the scripts running in the background, make sure the script is executable and add it to your autostart configuration

## Descriptions
* bt_idle_shutdown - Automatically disables Bluetooth when no devices are connected after a specified amount of time. Works on most Linux distributions using BlueZ and bluetoothctl.
* theme-switch.sh - Automatically changes KDE Plasma color scheme based on the given time. Should work on every linux distro with Plasma 6. Switching times and check intervals can be configured by modifying variables in the script.
