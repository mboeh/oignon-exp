#!/bin/sh

export HTTP_PORT=8080

docker run -d -p 8080:$HTTP_PORT --name app_hello                     -e HTTP_PORT=$HTTP_PORT -v $(pwd)/apps/hello:/app       -w /app oignon/lapis /bin/bash -c 'moonc -w *.moon & lapis server'
docker run -d -p 8081:8081       --name app_resty_hello --expose=8081 -v $(pwd)/apps/resty-hello:/app -w /app oignon/lapis /bin/bash -c '/usr/local/openresty/nginx/sbin/nginx -p `pwd` -c nginx.conf'
docker run -d -p 8082:$HTTP_PORT --name app_ruby_hello                -e HTTP_PORT=$HTTP_PORT -v $(pwd)/apps/hello-ruby:/app  -w /app oignon/sinatra
