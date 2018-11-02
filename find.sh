#!/bin/bash

which
whereis
locate

find /etc -name "*http*" # 按文件名查找
find / -type f # 查找某一类型文件
find / -perm # 按照文件权限查找
find / -user # 按照文件属主查找
find / -group # 按照文件所属的组来查找文件
find / -atime -n # 文件使用时间在N天以内
find / -atime +n # 文件使用时间在N天以前
find / -mtime -n # 文件内容改变时间在N天以内
find / -mtime +n # 文件内容改变时间在N天以前
find / -ctime +n # 文件状态改变时间在N天前
find / -ctime -n # 文件状态改变时间在N天内
find / -type f -mtime +7 -exec rm -rf {} \; # 删除7天之前的文件
find / -size +1000000c -print # 查找文件长度大于1M字节的文件
find /etc -name "*passwd*" -exec grep "123456" {} \; # 按名字查找文件传递给-exec后命令
find / -name 't*' -exec basename {} \;  # 查找文件名,不取路径
find / -type f -name "err*" -exec  rename err ERR {} \; # 批量改名(查找err 替换为 ERR {}文件
find / -name *name1* -or -name *name2*  # 查找任意一个关键字


grep -v # 取反
grep -E "word1|word2|word3" file
grep "^\s*[^# \t].*$" file #grep过滤注释行(包括前空白)和空白行过滤注释行(包括前空白)和空白行

find . -type f -name "*" |xargs grep "xxx" # 递归查找
grep "xxx" `find . -type f -name "*"`