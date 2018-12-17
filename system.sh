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

netstat -anp --tcp | grep port
ps [-ef|aux] | grep java
ps -T -p <pid>  查看进程中的线程

sysctl -a                   # 查看当前所有系统内核参数
lsof -i tcp:3000 # 查看谁在使用3000端口
lsof -p pid  # 查看进程打开的文件
lsof file  # 查看谁正在使用文件

top
1 可以显示所有CPU核心的负载情况
M 根据驻留内存大小进行排序。
P 根据CPU使用百分比大小进行排序。
T 根据时间/累计时间进行排序。

top -H -p pid  查看进程中的线程

# 查看进程中最耗cpu的线程
top -H  -b -n 1 -p $pid | sed '1,/^$/d' | grep -v $pid | grep -v PID | sort -nrk9 | head -1
# 对tid进行16进制转换
printf "%0x" tid

free

vmstat
vmstat -S m 1 5  每隔1s输出一次，总共输出5次，单位位m

iostat

-c 单独显示avg-cpu部分
-d 单独显示Device部分

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

python -m SimpleHTTPServer 8080
python3 -m http.server 8080

http_proxy=http://<proxy_username>:<proxy_password>@<your_proxy_server>:<your_proxy_port>  curl -I http://google.com/

/etc/hosts
/etc/resolv.conf #dns配置
/etc/rc.local #开机启动
/etc/profile #环境变量
/var/log/messages #系统日志
/etc/yum.repos.d/
