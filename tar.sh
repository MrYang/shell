#!/bin/bash

tar xvf 1.tar -C 指定目录 # 解包tar
tar -cvf 1.tar *             # 打包tar
tar tvf 1.tar                # 查看tar
tar -rvf 1.tar 文件名        # 给tar追加文件
tar --exclude=/home/dir --exclude=*.tar -zcvf file.tar.gz /home/* /etc      # 打包/home, /etc ，排除 /home/dir