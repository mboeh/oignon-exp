#!/bin/sh

curl -i -g -X PUT --data '{"user": {"name": "Matthew Boeh"}}' http://localhost:49083/users/mboeh
echo
curl -i -g -X PUT --data '{"password": "abc"}' http://localhost:49083/users/mboeh/password
echo
curl -i -g -X POST --data '{"password": "abc"}' http://localhost:49083/users/mboeh/login
echo
curl -i "http://localhost:49084/greet?uid=mboeh&token=3ceb49350837b7b29b7f2327b4a1b49b"
