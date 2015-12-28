#!/bin/sh

curl -X DELETE "localhost:9200/*"
curl -X GET "localhost:9200/_stats?pretty"
curl -X GET "localhost:9200/index/type/_search?q=tag:java"
curl -X GET "localhost:9200/database/table/_search?pretty" -d '{"query":{"match":{"tag":"java"}}}'
curl -X GET "localhost:9200/database/table/_id?pretty"
curl -X POST "localhost:9200/database/table?pretty" -d '{title: "java", tag: "java"}'
curl -X PUT "localhost:9200/database/table/_id?pretty" -d '{title: "groovy", tag: "groovy"}'
curl -X DELETE "localhost:9200/database/table/_id?pretty"