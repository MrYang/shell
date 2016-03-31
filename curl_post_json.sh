#!/bin/sh

curl -H "Content-Type: application/json; charset=UTF-8" -X POST -d '{"data":"data"}' http://ip:port
curl -F "photo=@/home/photo.jpg" -X POST -F 'userId=1' http://ip:port
