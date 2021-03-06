#!/bin/bash

ll -thr # 按时间倒叙列出所有目录和文件
ll -Shr # 按文件大小顺序排
touch file
rm -rf [dir|file]
ln source target #链接
ln -s source target #符号链接
cat file | nl | less #上下翻页且显示行号
head -n file
tail -f log #查看日志,日志有改动,可以滚动查看
tail -c 10m #截取文件末尾10M内容
file #查看文件类型
uniq   # 删除重复的行,对文本操作时，它一般会和 sort 命令进行组合使用，uniq 不会检查重复的行，除非它们是相邻的行
uniq -c # 重复的行出现次数
uniq -u # 只显示不重复行,
cut -d: -f1 # 分隔符:,去第一列, cut -d ':' -f 1-3
wc -l
cp filename{,.bak} # 快速备份文件

sort
	-t  # 指定排序时所用的栏位分隔字符
    -n  # 依照数值的大小排序
    -r  # 以相反的顺序来排序
    -f  # 排序时，将小写字母视为大写字母
    -d  # 排序时，处理英文字母、数字及空格字符外，忽略其他的字符
    -b  # 忽略每行前面开始处的空格字符
    -k  # 指定域

sort -n # 按数字排序
sort -nr # 按数字倒叙
sort -u # 过滤重复行
sort -m a.txt c.txt   # 将两个文件内容整合到一起
sort -n -t' ' -k 2 -k 3 a.txt     # 第二域相同，将从第三域进行升降处理
sort -n -t':' -k 3r a.txt         # 以:为分割域的第三域进行倒叙排列
sort -k 1.3 a.txt                 # 从第三个字母起进行排序
sort -t" " -k 2n -u  a.txt        # 以第二域进行排序，如果遇到重复的，就删除

df -h
du --max-depth=1 /opt

tar xvf 1.tar -C 指定目录 # 解包tar
tar -cvf 1.tar *             # 打包tar
tar tvf 1.tar                # 查看tar
tar -rvf 1.tar 文件名        # 给tar追加文件
tar --exclude=/home/dir --exclude=*.tar -zcvf file.tar.gz /home/* /etc      # 打包/home, /etc ，排除 /home/dir

gzip -r logs # 递归压缩目录，压缩后源文件消失
gzip -d # 解压

chown -R owner[:group] dir
chgrp -R group dir
chmod +x file