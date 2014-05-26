#!/bin/sh

docker build -t oignon/app-hello-ruby apps/hello-ruby
docker build -t oignon/app-users apps/users
docker build -t oignon/app-surface apps/resty-surface
