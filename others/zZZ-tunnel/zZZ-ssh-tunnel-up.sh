#!/bin/bash

echo [$(hostname)-$$-$(date +"%Y-%m-%d-%H:%M:%S")] setting IP forwarding ...
echo 1 > /proc/sys/net/ipv4/ip_forward

echo [$(hostname)-$$-$(date +"%Y-%m-%d-%H:%M:%S")] configuring interface ...
ifconfig tun99 prod2 pointopoint p1iw

echo [$(hostname)-$$-$(date +"%Y-%m-%d-%H:%M:%S")] creating arp entry ...
arp -sD p1iw eth0 pub

echo [$(hostname)-$$-$(date +"%Y-%m-%d-%H:%M:%S")] adding route for SPM DRA ...
route add -host 164.109.63.30 dev tun99

sleep 3
pingResponse=1
while [ $pingResponse -ne 0 ];do
	sleep 3
	pingResponse=$(ping -n -c 30 p1iw | grep 'received' | awk -F',' '{ print $2 }' |	awk '{ print $1 }')
done
echo [$(hostname)-$$-$(date +"%Y-%m-%d-%H:%M:%S")] prod2 can NOT ping p1iw: EXIT
