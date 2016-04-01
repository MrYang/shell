#!/bin/sh

mysqldump -u root -p --databases database1 database2 database3 > /home/mysql/bak.sql
service mysqld stop

yum remove mysql mysql-server mysql-common-libs
find / -name mysql
whereis mysql
#rm -rf /usr/share/mysql

#yum install http://www.percona.com/downloads/percona-release/redhat/0.1-3/percona-release-0.1-3.noarch.rpm
#yum install Percona-XtraDB-Cluster-56

yum install mysql-server

service mysqld start;
mysqladmin -u root password "111111"
use mysql;
select Host,User,Password from user;
update user set Host='%', Password='' where Host='hostname' and User='root';
flush privileges