#!/bin/sh

docker search mongo
docker pull mongo
docker iamges
docker ps 

#docker rm image
#docker rmi container;

docker exec -ti container /bin/bash
docker run --rm -t -i ubuntu /bin/bash
docker inspect -f "{{.Volumes}}" mongo
docker logs -f mongo

docker run -p 8081:8080 --rm tomcat:8-jre8

docker run --name redis -p 6379:6379 -v /home/webapps/redis/data:/data -d redis
docker run --name mongo -p 27017:27017 -v /home/webapps/mongo/data:/data/db -d mongo
docker run --name tomcat -p 8080:8080 -v /home/webapps/web/:/usr/local/tomcat/webapps/web/ -d tomcat:8-jre8
docker run --name mysql -p 3307:3306 -v /home/webapps/mysql/data/:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql
docker run --name elasticsearch -p 9200:9200 -p 9300:9300 -v /home/webapps/elasticsearch/data:/usr/share/elasticsearch/data -d elasticsearch

docker run --name tomcat -p 8080:8080 -v /home/webapps/web/:/usr/local/tomcat/webapps/web/ --link mysql:tomcat-msyql -d tomcat:8-jre8

docker stop container
docker start container