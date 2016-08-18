#!/bin/bash

#终端快捷键
Ctrl+A # 行前
Ctrl+E # 行尾
Ctrl+S # 终端锁屏
Ctrl+Q # 解锁屏
Ctrl+D # 退出

date -s 20091112                     # 设日期
date -s 18:30:50                     # 设时间
date -d "7 days ago" +%Y%m%d         # 7天前日期
date -d "5 minute ago" +%H:%M        # 5分钟前时间
date -d "1 month ago" +%Y%m%d        # 一个月前
date -d '1 days' +%Y-%m-%d           # 一天后
date -d '1 hours' +%H:%M:%S          # 一小时后
date +%Y-%m-%d -d '20110902'         # 日期格式转换
date +%Y-%m-%d_%X                    # 日期和时间
date "+%Y-%m-%d %H:%M:%S"            # 日期和时间
date +%N                             # 纳秒
date -d "2012-08-13 14:00:23" +%s    # 换算成秒计算(1970年至今的秒数)
date -d "@1363867952" +%Y-%m-%d-%T   # 将时间戳换算成日期
date -d "1970-01-01 UTC 1363867952 seconds" +%Y-%m-%d-%T  # 将时间戳换算成日期
date -d "`awk -F. '{print $1}' /proc/uptime` second ago" +"%Y-%m-%d %H:%M:%S"    # 格式化系统启动时间(多少秒前)