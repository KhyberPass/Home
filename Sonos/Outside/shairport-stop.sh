#!/bin/bash

# Turn off amp
/usr/bin/gpio -g write 14 0

# Start squeeze as ALSA cant shair the port
/usr/bin/sudo /etc/init.d/squeezelite  start

# Setup the gpio
#/bin/echo 17  > /sys/class/gpio/export
#/bin/echo out > /sys/class/gpio/gpio17/direction
#/bin/echo 0 > /sys/class/gpio/gpio17/value

#/bin/echo 17  > /sys/class/gpio/unexport
