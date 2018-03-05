#!/bin/bash
echo compressing kibana logtrail plugin...
zip -r logtrail.zip  kibana
echo done.
echo building docker image...
docker build -t "docker-kibana5:dockerfile" .
echo done. 
echo running kibana container...
docker rm -f docker-kibana5:dockerfile
docker run -d -e ELASTICSEARCH_URL=http://elasticsearch-esamp5.service.chidc2.consul:9200 -p 5601:5601 docker-kibana5:dockerfile
echo done.
