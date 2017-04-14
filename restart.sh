#!/bin/sh

TIMEOUT=$(($HEARTBEAT_TIMEOUT+$WAKEUP_DELAY))

sleepi2ctl --set sleep 0
if [ "$RETRY_BOOT" != "0" ]
then
	sleepi2ctl --set restart 1
else
	sleepi2ctl --set restart 0
fi

sleepi2ctl --set timeout $TIMEOUT
sleepi2ctl --set wakeup-delay $WAKEUP_DELAY

