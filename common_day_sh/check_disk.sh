#!/bin/bash

disk_sda1=`df -h |sed -n '3p'|awk '{print $4}'|cut -f 1 -d '%'`
if ((disk_sda1 > 80)); then
	echo `date` "硬盘超过80%了,快快删东西啦"
else
	echo "this is ok"
fi