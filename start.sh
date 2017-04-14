#!/bin/sh

sleepi2ctl --set extin-powerdown $EXTIN_FORCED_SHUTDOWN
sleepi2ctl --set extin-trigger $EXTIN_LEVEL_TRIGGER
sleepi2ctl --set ri-trigger $RI_LEVEL_TRIGGER

sleepi2ctl --set timeout $HEARTBEAT_TIMEOUT
sleepi2ctl --set wakeup-delay $WAKEUP_DELAY

sleepi2ctl --set restart 1
sleepi2ctl --set sleep 0
