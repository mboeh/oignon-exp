FROM oignon/base 
RUN apt-get install -y ruby
RUN gem install --no-ri --no-rdoc bundler foreman

WORKDIR /app

EXPOSE 8080
CMD /bin/bash -c 'bundle install && foreman start'
