#!/bin/bash

awk内建变量
$0	当前记录（这个变量中存放着整个行的内容）
$1~$n	当前记录的第n个字段，字段间由FS分隔
FS	输入字段分隔符 默认是空格或Tab
NF	当前记录中的字段个数，就是有多少列
NR	已经读出的记录数，就是行号，从1开始，如果有多个文件话，这个值也是不断累加中。
FNR	当前记录数，与NR不同的是，这个值会是各个文件自己的行号
RS	输入的记录分隔符， 默认为换行符
OFS	输出字段分隔符， 默认也是空格
ORS	输出的记录分隔符，默认为换行符
FILENAME	当前输入文件的名字

awk '{print $1, $4}' netstat.txt  # 打印第一列，第四列
awk '{printf "%-8s %-8s\n", $1, $4}' netstat.txt  # 格式化
awk '$3==0 && $6=="LISTEN" || NR == 1 {printf "%-8s %-8s\n", $1, $4}' netstat.txt  # 第三列＝0，第六列＝LISTEN
awk '$6 ~ /WAIT/ || NR==1 {print NR,$4,$5,$6}' OFS="\t" netstat.txt # ~/WAIT/ 匹配

awk 'NR!=1{if($6 ~ /TIME|ESTABLISHED/) print > "1.txt";
else if($6 ~ /LISTEN/) print > "2.txt";
else print > "3.txt" }' netstat.txt # if 语句

ls -l  *.cpp *.c *.h | awk '{sum+=$5} END {print sum}' # 计算所有文件大小

ps aux | awk 'NR!=1{a[$1]+=$6;} END { for(i in a) print i ", " a[i]"KB";}' # 统计每个用户的进程的占了多少内存

awk '/joint/ {print $1,$2,$9}' access.log | awk -F',' '{print $1,$2}' | awk -F'=' '{if($2>100){print $0}}'

awk  -F: '{print $1,$3,$6}' /etc/passwd # 指定分割符:,多个分割符'[;:]'


sed：

s 替换
i 行前插入
a 行后插入
d 删除行
c 匹配行
p 打印  可以把这个命令当成grep式的命令


sed "s/my/his/g" pets.txt  # 修改my 为 his， /g 表示一行上的替换所有的匹配
sed -i "s/my/his/g" pets.txt # 写回原文件
sed 's/^/#/g' pets.txt  # 在每行最前面加'#'号码
sed '/baz/s/foo/bar/g'  # 只在行中出现字串"baz"的情况下将"foo"替换成"bar"
sed '/baz/!s/foo/bar/g' # 将"foo"替换成"bar"，并且只在行中未出现字串"baz"的情况下替换

^ 表示一行的开头。如：/^#/ 以#开头的匹配。
$ 表示一行的结尾。如：/}$/ 以}结尾的匹配。
\< 表示词首。 如 \<abc 表示以 abc 为首的詞。
\> 表示词尾。 如 abc\> 表示以 abc 结尾的詞。
. 表示任何单个字符。
* 表示某个字符出现了0次或多次。
[ ] 字符集合。 如：[abc]表示匹配a或b或c，还有[a-zA-Z]表示匹配所有的26个字符。如果其中有^表示反，如[^a]表示非a的字符

sed "3,6s/my/your/g" pets.txt  # 只替换第3到第6行的文本
sed 's/s/S/1' my.txt  # 只替换每一行的第一个s
sed 's/s/S/2' my.txt  # 只替换每一行的第二个s
sed 's/s/S/3g' my.txt # 只替换第一行的第3个以后的s

sed "1 i insert line" my.txt # 在第一行前插入
sed "1 a after line" my.txt # 在第一行后插入
sed "/fish/a after fish line" # 匹配到/fish/后就追加一行

sed '/fish/d' my.txt  # 删除匹配行
sed '2d' my.txt   # 删除第二行
sed '2,$d' my.txt # 删除第二行到最后一行

sed "2 c replace line" my.txt # 替换第二行
sed "/fish/c replace line" my.txt # 匹配到/fish/后替换

// 端口占用
netstat -anp |grep 6321 | awk '{print $5}' | awk -F ':' '{print $1}' | sort | uniq -c | sort -nrk 1