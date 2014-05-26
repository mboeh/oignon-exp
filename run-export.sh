#!/bin/sh

export HTTP_PORT=8080

docker run -d \
  --name oignon-redis \
  oignon/redis
docker run -d \
  --name oignon-hello \
  -e HTTP_PORT=$HTTP_PORT \
  oignon/app-hello-ruby
docker run -d \
  -p 49083:$HTTP_PORT \
  --name oignon-users \
  --link oignon-redis:redis \
  -e HTTP_PORT=$HTTP_PORT \
  oignon/app-users
docker run -d \
  -p 49084:$HTTP_PORT \
  --name surface \
  --link oignon-users:app_users \
  --link oignon-hello:hello \
  oignon/app-surface
