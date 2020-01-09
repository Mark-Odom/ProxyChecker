#!/bin/bash

time=3
pingsite=ifconfig.me

while read proxy;
do
	code=$(curl -s -o /dev/null -w "%{http_code}" --connect-timeout $time --socks5 $proxy $pingsite)
	if [ $code == 200 ]
	then
		echo "OK"
		echo "$proxy"
		echo "$proxy" >> WorkingProxies.txt
	else
		echo "Fail:"
		echo "$proxy"
	fi
done < "$1"
