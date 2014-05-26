FROM ubuntu:14.04 
MAINTAINER Matthew Boeh <m@mboeh.com>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list

# Essential packages that every container will need
RUN apt-get update && apt-get -y install \
  locales \
  wget \
  libpq-dev \
  git \
  build-essential \
  ruby
