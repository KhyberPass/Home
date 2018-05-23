# Setup for Sonos Lounge

A music player using Raspberry Pi and squeezelite.

- Raspberry Pi - 1 B+
- USB audio device 
- External Amplifier
- Power controlled by GPIO

Note: this setup was done before the control options for GPIO and scripts were added to squeezelite.

The amplifier power is controlled by a relay driven from the Pi GPIO.
The debug output from squeezelite is logged to a file which is then read by a script the looks for start commands.

The start script does the following

```
SLLOG=/tmp/squeezelite.log
SLOPTIONSLOG="-d slimproto=info -f /tmp/squeezelite.log "
DAEMON_ARGS="${SLOPTIONS} ${SLMAC} ${SBSHOST} ${SLOPTIONSLOG}"
...
    if [ -f ${SLLOG} ]; then
        rm ${SLLOG}
    fi
    # Make the file for the degug output
    mkfifo ${SLLOG}

    start-stop-daemon --start --quiet --make-pidfile --pidfile $PIDFILE --background --exec $DAEMON -- $DAEMON_ARGS || return 2

    nohup cat ${SLLOG} | /home/pi/squeezecontrol.sh &
}
```
This runs the following
```
cat /tmp/squeezelite.log
/bin/bash /home/pi/squeezecontrol.sh
startpar -f -- squeezelite
/usr/bin/squeezelite-armv6hf -o front:CARD=DAC,DEV=0 -n Lounge -a 80 -m b8 27 eb b8 c7 e1 -s 192.168.111.100 -d slimproto info -f /tmp/squeezelite.log
```
