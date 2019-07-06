#!/bin/bash

if [ $# -eq 0 ] ; then
    echo 'Add an argument'
    exit 1
fi

if [ $1 -eq 0 ] ; then
 irsend SEND_ONCE pana KEY_TUNER
 irsend SEND_ONCE pana KEY_POWER
elif [ $1 -eq 1 ] ; then
 irsend SEND_ONCE pana KEY_TAPE
elif [ $1 -eq 2 ] ; then
 echo ''
else
 echo 'Invalid'
fi
