#!/bin/bash

# Setup the gpio
echo 17  > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio17/direction
echo 0 > /sys/class/gpio/gpio17/value

# Read a line from stdio, this is a blocking call
while read line
do
        #echo "Processing " $line
        # Split the string line into an array
        linearr=( $line )
        #echo "Test " ${linearr[3]}

        if [ "${linearr[3]}" = 'command' ] && [ "${linearr[4]}" = 's' ]; then
                echo 1 > /sys/class/gpio/gpio17/value
                echo "Start"
        fi

        if [ "${linearr[3]}" = 'command' ] && [ "${linearr[4]}" = 'u' ]; then
                echo 1 > /sys/class/gpio/gpio17/value
                echo "Unpause"
        fi

        if [ "${linearr[3]}" = 'command' ] && [ "${linearr[4]}" = 'p' ]; then
                echo 0 > /sys/class/gpio/gpio17/value
                echo "Pause"
        fi
done
