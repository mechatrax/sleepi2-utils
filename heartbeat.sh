#!/bin/bash

while true
do
  for i in `seq 2`
  do
    echo 255 > ${LED_PATH}/brightness
    sleep 0.1
    echo 0 > ${LED_PATH}/brightness
    sleep 0.1
  done
  sleep 0.6
done
