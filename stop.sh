#!/bin/sh

sleepi2ctl --set sleep 1
if [ "$RETRY_BOOT" != "0" ]
then
	sleepi2ctl --set restart 1
else
	sleepi2ctl --set restart 0
fi

sleepi2ctl --set timeout $SHUTDOWN_DELAY
sleepi2ctl --set wakeup-delay $WAKEUP_DELAY

echo heartbeat > ${LED_PATH}/trigger
