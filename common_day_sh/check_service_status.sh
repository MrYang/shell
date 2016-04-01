#!/bin/sh

check_tc_server(){
  tc_server_path='/opt/tc-server/'
  tc_servers=("${tc_server_path}-web" "${tc_server_path}-web-1" "${tc_server_path}-app" "${tc_server_path}-app-1")
  for server in ${tc_servers[@]}
  do
    if [ -e "$server/logs/tcserver.pid" ];then
      pid=`cat $server/logs/tcserver.pid`
      num=`ps -ef | grep $pid | wc -l`
      if [ $num -gt 1 ];then
        echo "${server} is ok."
		continue;
      fi
	fi
	
	echo "${server} is error; please start ${server}"
    echo "execute command: ${server}/bin/tcruntime-ctl.sh start"
  done
}

check_nginx(){
  if [ -e "/var/run/nginx.pid" ];then
    pid=`cat /var/run/nginx.pid`
    num=`ps -ef | grep $pid | wc -l`
    if [ $num -gt 1 ];then
	  echo 'nginx is ok.'
	  return
	fi
  fi
  
  echo 'nginx is error; please start nginx'
}

check_mysqld(){
  if [ -e "/var/run/mysqld/mysqld.pid" ];then
    pid=`cat /var/run/mysqld/mysqld.pid`
    num=`ps -ef | grep $pid | wc -l`
    if [ $num -gt 1 ];then
	  echo 'mysqld is ok.'
	  return
	fi
  fi
  
  echo "mysqld is error; please start mysqld"
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