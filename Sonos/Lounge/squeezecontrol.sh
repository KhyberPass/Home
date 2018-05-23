#!/bin/bash

# Setup the gpio
echo 17  > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio17/direction
echo 0 > /sys/class/gpio/gpio17/value

# Init the timer and state
timerlast=$(date '+%s')
timerdiff=0
state=0

# Read a line from stdio, this is a blocking call
while read line
do
        #echo "Processing " $line
        # Split the string line into an array
        linearr=( $line )
        #echo "Test " ${linearr[3]}

        if [ "${linearr[3]}" = 'command' ] && [ "${linearr[4]}" = 's' ]; then
                timerlast=$(date '+%s')
                state=1
                echo 1 > /sys/class/gpio/gpio17/value
                #echo "Start"
        fi

        if [ "${linearr[3]}" = 'command' ] && [ "${linearr[4]}" = 'u' ]; then
                timerlast=$(date '+%s')
                state=1
                echo 1 > /sys/class/gpio/gpio17/value
                #echo "Unpause"
        fi

        timercurr=$(date '+%s')
        timerdiff=$(($timercurr - $timerlast))
        if [ $state -eq 1 ] && [ $timerdiff -gt 600 ]; then
                state=0
                echo 0 > /sys/class/gpio/gpio17/value
                #echo "Off"
        fi

done

# Remove the gpio setup when exiting
echo 17  > /sys/class/gpio/unexport
