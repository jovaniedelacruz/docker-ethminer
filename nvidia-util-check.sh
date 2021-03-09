#!/bin/bash
util=$(nvidia-smi -q -d UTILIZATION | awk '/Gpu/ { print $3 }')
echo "checking gpu utilization"
if [ $util -lt 80 ]; then
  echo "restarting container"
  cd /extra/mining/bin
  /usr/local/bin/docker-compose restart
else
  echo "continuing"
fi
