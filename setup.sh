#!/bin/sh

curl -i -g -X PUT --data '{"user": {"name": "Matthew Boeh"}}' http://localhost:8083/users/mboeh
echo
curl -i -g -X PUT --data '{"password": "abc"}' http://localhost:8083/users/mboeh/password
echo
curl -i -g -X POST --data '{"password": "abc"}' http://localhost:8083/users/mboeh/login
echo
curl -i "http://localhost:8084/greet?uid=mboeh&token=TOKEN"
