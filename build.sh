#!/bin/sh

docker build -t oignon/openresty dockers/openresty
docker build -t oignon/lapis dockers/lapis
docker build -t oignon/sinatra dockers/sinatra
