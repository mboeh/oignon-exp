#!/bin/sh

docker run -d -p 8080:8080 --name app_hello       --expose=8080 -v $(pwd)/apps/hello:/app       -w /app oignon/lapis /bin/bash -c 'moonc -w *.moon & lapis server'
docker run -d -p 8081:8081 --name app_resty_hello --expose=8081 -v $(pwd)/apps/resty-hello:/app -w /app oignon/lapis /bin/bash -c '/usr/local/openresty/nginx/sbin/nginx -p `pwd` -c nginx.conf'
