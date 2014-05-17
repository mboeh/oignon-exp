#!/bin/sh

docker stop app_hello
docker rm app_hello
docker stop app_resty_hello
docker rm app_resty_hello
docker stop app_ruby_hello
docker rm app_ruby_hello
