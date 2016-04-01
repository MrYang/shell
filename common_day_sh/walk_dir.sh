#!/bin/sh

function walk(){
  for file in `ls $1`
  do  
    local path=$1"/"${file}
    if [ -d ${path} ];then
      walk ${path}
    else
      curl -F "photo=@${path}" "http://127.0.0.1:8080/parsePhoto"
    fi
  done
}

if [ $# -ne 1 ];then
  echo "请输入目录参数"
else
  walk $1
fi