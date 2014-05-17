# Based on https://github.com/torhve/lapis-docker
FROM oignon/openresty
MAINTAINER Matthew Boeh <m@mboeh.com>

RUN    apt-get -y install luarocks

RUN    luarocks install --server=http://rocks.moonscript.org/manifests/leafo lapis
RUN    luarocks install --server=http://rocks.moonscript.org/manifests/leafo moonscript
RUN    luarocks install date

WORKDIR /app
EXPOSE 8080
CMD lapis server
