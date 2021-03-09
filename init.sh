#!/bin/bash
echo $(date '+%Y %b %d %H:%M') Starting Ethminer with GPU Utilization Check Cronjob
service cron start
/usr/local/bin/ethminer -U --HWMON 2 --tstart ${GPU_TEMP_START} --tstop ${GPU_TEMP_STOP} --exit --api-port -${ETHMINER_API_PORT} -P ${STRATUM}://${WALLET_ADDR}.${WORKER}:${WORKER_PASS}@${MINING_POOL}:${MINING_POOL_PORT}
