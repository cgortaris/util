#!/usr/bin/bash

declare -A IPS
for ip in $(~/bin/blockedIPs.sh)
do
    IPS[$ip]=blocked
done

for suspicious in $(~/bin/suspiciousIPs.sh)
do
    if [ ${IPS[$suspicious]+_} ]; then
        printf '%-15s blocked\n' $suspicious
    else
        printf '%-15s NOT blocked!\n' $suspicious
    fi
done
