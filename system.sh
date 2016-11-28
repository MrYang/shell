#!/bin/bash

ntpdate ntp.ubuntu.com	#同步时间
crontab -[l|e]	#定时任务
#分钟  小时    天  月  星期
#1,30  1-3/2    *   *   *
service httpd start|stop|restart
chkconfig httpd on|off
chkconfig --level 35 httpd off  #让服务不自动启动
chkconfig --level 35 httpd on # 让服务自动启动 35指的是运行级别
chkconfig --list |grep httpd # 查看某个服务的启动状态

cat /proc/version # 查看内核版本
cat /etc/issue # 查看系统版本
lsb_release -a # 查看系统版本centos-release
uptime
whoami

netstat -anp | grep port
ps [-ef|aux] | grep java
sysctl -a                   # 查看当前所有系统内核参数
lsof

top
free
vmstat
iostat

chmod +x shell.sh
kill pid # kill -9 pid 强制杀死

#开奖脚本启动顺序
/etc/profile
/etc/profile.d/*.sh
~/bash_profile
~/.bashrc
/etc/bashrc

ulimit -SHn 65535 # 临时设置文件描述符大小 进程最大打开文件柄数 还有socket最大连接数, 等同配置 nofile
ulimit -SHu 65535 # 临时设置用户最大进程数
ulimit -a # 查看

ssh -p 22 root@192.168.152.10
scp -r local_dir root@192.168.152.10:remote_dir

/etc/hosts
/etc/resolv.conf #dns配置
/etc/rc.local #开机启动
/etc/profile #环境变量
/var/log/messages #系统日志
/etc/yum.repos.d/
