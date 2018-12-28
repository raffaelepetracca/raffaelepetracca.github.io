#!/bin/bash

COUNT=0;
while [ $(ifconfig -a | grep tun99 | wc -l) -eq 1 ]; do
	PID_TO_KILL=$(lsof | grep '/dev/net/tun' | grep sshd | awk '{print $2}');
	echo [$(hostname)-$$-$(date +"%Y-%m-%d-%H:%M:%S")] killing: $(ps -f -p ${PID_TO_KILL} | tail -1)
	kill -9 ${PID_TO_KILL};
	sleep 1;
	COUNT=$((COUNT+1));
	if [ $COUNT -gt 2 ]; then
		exit 1;
	fi
done

exit 0;

