#!/bin/sh

curl -g -X PUT --data '{"user": {"name": "Matthew Boeh"}}' http://localhost:8083/users/mboeh
curl -i "http://localhost:8084/greet?uid=mboeh"
