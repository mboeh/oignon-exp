#!/bin/sh

docker build -t oignon/base dockers/base
docker build -t oignon/openresty dockers/openresty
docker build -t oignon/lapis dockers/lapis
docker build -t oignon/sinatra dockers/sinatra
docker build -t oignon/redis dockers/redis
