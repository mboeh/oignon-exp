#!/bin/sh

export HTTP_PORT=8080

#docker run -d -p 8080:$HTTP_PORT --name app_hello                     -e HTTP_PORT=$HTTP_PORT -v $(pwd)/apps/hello:/app       -w /app oignon/lapis /bin/bash -c 'moonc -w *.moon & lapis server'
#docker run -d -p 8081:8081       --name app_resty_hello --expose=8081 -v $(pwd)/apps/resty-hello:/app -w /app oignon/lapis /bin/bash -c '/usr/local/openresty/nginx/sbin/nginx -p `pwd` -c nginx.conf'

docker run -d --name redis oignon/redis

docker run -d --name app_ruby_hello                -e HTTP_PORT=$HTTP_PORT -v $(pwd)/apps/hello-ruby:/app  -w /app oignon/sinatra
docker run -d -p 8083:$HTTP_PORT --name app_users --link redis:redis -e HTTP_PORT=$HTTP_PORT -v $(pwd)/apps/users:/app  -w /app oignon/sinatra

docker run -d -p 8084:$HTTP_PORT --name surface --link app_users:app_users --link app_ruby_hello:hello -v $(pwd)/apps/resty-surface:/app -w /app oignon/openresty
