#!/bin/sh

walk(){
  for file in `ls $1`
  do
    local path=$1"/"${file}
    if [ -d ${path} ];then
      walk ${path}
    else
      echo $path
    fi
  done
}

# sh open.sh arg1 arg2 arg3
walk_2(){
  while [ $# != 0 ];do
      for f in `ls $1 | grep "gz"`
      do
          zgrep "openTreasureBox,awardInfo###" $1/${f} | awk '{print $1,$2,$8}' | awk -F ' openTreasureBox,awardInfo###' '{print $1"," $2}' >> /tmp/open.csv
      done
      shift
  done

}

cut_nginx_log(){
  nginx_path="/usr/local/nginx"
  yesterday=`date -d yesterday +%Y%m%d`

  mv "${nginx_path}/logs/access.log" "${nginx_path}/logs/access.${yesterday}.log"
  kill -USR1 `cat ${nginx_path}/logs/nginx.pid`

  #把每天超过1s的请求记录下来
  awk '$9>1 {print $4,$5, $6, $7, $9, $10}' ${nginx_path}/logs/access.${yesterday}.log > ${nginx_path}/logs/long_time.${yesterday}.txt
}

check_disk(){
  disk=`df -h |sed -n '3p'|awk '{print $4}'|cut -f 1 -d '%'`
  if ((disk > 80)); then
  	echo `date` "硬盘超过80%了,快快删东西啦"
  else
  	echo "this is ok"
  fi
}

curl_json(){
  curl -i -X POST -H "Content-Type: application/json; charset=UTF-8" -H 'Accept':'application/json' -d '{"data":"data"}' http://ip:port
  curl -F "photo=@/home/photo.jpg" -X POST -F 'userId=1' http://ip:port
}

curl -X POST --data "data=xxx" example.com/form.cgi
curl -X POST --data-urlencode "date=April 1" example.com/form.cgi

date_while(){
  start='20161001'
  end='20161128'

  while [[ $start < $end ]]
  do
      echo $start
      start=`date -d "+1 day $start" +%Y%m%d`
  done
}