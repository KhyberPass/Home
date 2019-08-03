#!/bin/bash

# Turn on the amp
/usr/bin/gpio -g mode 14 out
/usr/bin/gpio -g write 14 1

# Stop squeeze as ALSA cant shair the port
/usr/bin/sudo /etc/init.d/squeezelite  stop

#/usr/bin/sudo /bin/echo 17  > /sys/class/gpio/export
#/usr/bin/sudo /bin/echo out > /sys/class/gpio/gpio17/direction
#/usr/bin/sudo /bin/echo 1 > /sys/class/gpio/gpio17/value
