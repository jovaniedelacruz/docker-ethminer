#!/bin/bash
util=$(nvidia-smi -q -d UTILIZATION | awk '/Gpu/ { print $3 }')
echo $(date '+%Y %b %d %H:%M') Checking GPU Util
if [ $util -lt 80 ]; then
  echo echo $(date '+%Y %b %d %H:%M') Restarting container
  cd /extra/mining/bin
  /usr/local/bin/docker-compose restart
else
  echo echo $(date '+%Y %b %d %H:%M') Continuing
fi
