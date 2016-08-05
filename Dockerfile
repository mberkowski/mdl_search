FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs mysql-server mysql-client libmysqlclient-dev
RUN mkdir /mdl_search
WORKDIR /mdl_search
ADD . /mdl_search
RUN bundle install
