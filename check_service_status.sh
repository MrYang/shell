#!/bin/sh

check_tc_server(){
  tc_server_path='/opt/tc-server/'
  tc_servers=("${tc_server_path}-ams" "${tc_server_path}-ams-1" "${tc_server_path}-vasp" "${tc_server_path}-vasp-1")
  for server in ${tc_servers[@]}
  do
    pid=`cat $server/logs/tcserver.pid`
    num=`ps -ef | grep $pid | wc -l`
    if [ $num -gt 1 ];then
      echo "${server} is ok."
    else
      echo "${server} is error; please start ${server}"
    fi
  done
}

check_nginx(){
  pid=`cat /var/run/nginx.pid`
  num=`ps -ef | grep $pid | wc -l`
  if [ $num -gt 1 ];then
    echo 'nginx is ok.'
  else
    echo 'nginx is error; please start nginx'
  fi
}

check_mysqld(){
  pid=`cat /var/run/mysqld/mysqld.pid`
  num=`ps -ef | grep $pid | wc -l`
  if [ $num -gt 1 ];then
    echo "mysqld is ok."
  else
    echo "mysqld is error; please start mysqld"
  fi
}

check_vsftpd(){
  num=`ps -ef | grep vsftpd | wc -l`
  if [ $num -gt 1 ];then
    echo 'vsftpd is ok.'
  else
    echo 'vsftpd is error; please start vsftpd'
  fi
}

check_redis(){
  num=`ps -ef | grep redis | wc -l`
  if [ $num -gt 1 ];then
    echo "redis is ok."
  else
    echo "redis is error; please start redis"
  fi
}

check_mongod(){
  num=`ps -ef | grep mongod | wc -l`
  if [ $num -gt 1 ];then
    echo "mongod is ok."
  else
    echo "mongod is error; please start mongod"
  fi
}

check_tc_server
check_nginx
check_mysqld
check_vsftpd
check_redis
check_mongod