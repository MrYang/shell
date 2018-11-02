#!/bin/bash

rpm -ivh lynx          # rpm安装
rpm -e lynx            # 卸载包
rpm -e lynx --nodeps   # 强制卸载
rpm -qa                # 查看所有安装的rpm包
rpm -qa | grep lynx    # 查找包是否安装
rpm -ql                # 软件包路径
rpm -Uvh               # 升级包
rpm --test lynx        # 测试
rpm -qc                # 软件包配置文档
rpm --import  /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6     # 导入rpm的签名信息
rpm --initdb           # 初始化rpm 数据库
rpm --rebuilddb        # 重建rpm数据库  在rpm列表不好使的情况使用
rmp --install


yum list                 # 所有软件列表
yum install 包名         # 安装包和依赖包
yum -y update            # 升级所有包版本,依赖关系，系统版本内核都升级
yum -y update 软件包名   # 升级指定的软件包
yum -y upgrade           # 不改变软件设置更新软件，系统版本升级，内核不改变
yum search mail          # yum搜索相关包
yum grouplist            # 软件包组
yum -y groupinstall "Virtualization"   # 安装软件包组
yum clean all            # 清除var下缓存
yum localinstall xx.rpm

rpm -Uvh  http://mirrors.hustunique.com/epel//6/x86_64/epel-release-6-8.noarch.rpm
