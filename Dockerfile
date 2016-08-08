FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /mdl_search
WORKDIR /mdl_search
ADD . /mdl_search
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install --without production