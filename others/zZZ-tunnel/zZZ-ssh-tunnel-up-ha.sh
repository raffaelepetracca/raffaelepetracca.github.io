#!/bin/bash

echo [$(hostname)-$$-$(date +"%Y-%m-%d-%H:%M:%S")] configuring interface ...
ifconfig tun97 192.168.41.3 pointopoint 192.168.41.2

echo [$(hostname)-$$-$(date +"%Y-%m-%d-%H:%M:%S")] adding back route ...
route add default gw 192.168.41.2

sleep 3
pingResponse=1
while [ $pingResponse -ne 0 ];do
	sleep 3
	pingResponse=$(ping -c 5 192.168.41.2 | grep 'received' | awk -F',' '{ print $2 }' |	awk '{ print $1 }')
done
echo [$(hostname)-$$-$(date +"%Y-%m-%d-%H:%M:%S")] gw-ha can NOT ping back: EXIT

			


