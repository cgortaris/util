#!/usr/bin/bash

for ip in $(cat /var/log/secure|grep ailed | sed -n 's/^.*[^0-9] \([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\).*$/\1/p' | sort | uniq)
do 
    whois $ip
    read -p "Continue? ($ip)" cont
done
