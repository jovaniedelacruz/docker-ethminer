#!/bin/bash
util=$(nvidia-smi -q -d UTILIZATION | awk '/Gpu/ { print $3 }')
if [ $util -lt 80 ]; then
  pkill ethminer
  exit 1
else
  echo $(date '+%Y %b %d %H:%M') Continuing with GPU Util $util
  exit 1
fi
