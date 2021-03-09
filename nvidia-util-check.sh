#!/bin/bash
util=$(nvidia-smi -q -d UTILIZATION | awk '/Gpu/ { print $3 }')
if [ $util -lt 80 ]; then
  echo "GPU is underutilized; Restarting container"
  exit 1
else
  echo $(date '+%Y %b %d %H:%M') Continuing
  exit 1
fi
