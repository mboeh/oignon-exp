# Based on https://github.com/torhve/lapis-docker
FROM oignon/base

RUN echo "deb-src http://archive.ubuntu.com/ubuntu trusty main" >> /etc/apt/sources.list
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list

RUN apt-get -y build-dep nginx
RUN wget http://openresty.org/download/ngx_openresty-1.5.12.1.tar.gz
RUN tar xvfz ngx_openresty-1.5.12.1.tar.gz
RUN cd ngx_openresty-1.5.12.1 ; ./configure \
  --with-luajit  \
  --with-http_addition_module \
  --with-http_dav_module \
  --with-http_geoip_module \
  --with-http_gzip_static_module \
  --with-http_image_filter_module \
  --with-http_realip_module \
  --with-http_stub_status_module \
  --with-http_ssl_module \
  --with-http_sub_module \
  --with-http_xslt_module \
  --with-ipv6 \
  --with-http_postgres_module \
  --with-pcre-jit; \
  make ; make install

ADD bin/ /util-bin/
WORKDIR /app
ENTRYPOINT ["/util-bin/entrypoint.sh"]
CMD /usr/local/openresty/nginx/sbin/nginx -p /app -c /app/nginx.conf
