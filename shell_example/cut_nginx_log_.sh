#!/bin/bash

nginx_path="/usr/local/nginx"
yesterday=`date -d yesterday +%Y%m%d`

mv "${nginx_path}/logs/access.log" "${nginx_path}/logs/access.${yesterday}.log"
kill -USR1 `cat ${nginx_path}/logs/nginx.pid` 

#把每天超过1s的请求记录下来
cat ${nginx_path}/logs/access.${yesterday}.log | awk '$9>1 {print $4,$5, $6, $7, $9, $10}' > ${nginx_path}/logs/access_long_time.${yesterday}.txt
