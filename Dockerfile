FROM ruby:3.0
RUN apt-get update -qq
RUN apt-get install -y build-essential 

# The following are used to trim down the size of the image by removing unneeded data
RUN apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf \
      /var/lib/apt \
      /var/lib/dpkg \
      /var/lib/cache \
      /var/lib/log

WORKDIR /instabug
COPY Gemfile /instabug/Gemfile
COPY Gemfile.lock /instabug/Gemfile.lock
RUN bundle install


CMD rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'