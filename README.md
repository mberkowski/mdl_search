# MDL Search

An implementation of the [Blacklight Search](http://projectblacklight.org/) platform.

# Developer Quickstart

* [Install Docker](https://docs.docker.com/engine/installation)
* [Install Docker Compose](https://docs.docker.com/compose/)
* Install Ruby [e.g. via RVM](https://rvm.io/rvm/install)
* Install Bundler: `gem install bundler`
* `bundle install` to get project dependencies (use `--without production` to avoid having to install mysql)
* `rake solr:setup_dev` to get solr along with example index data
* docker-compose build
* docker-compose up

Note: will work on eliminating the Ruby install / bundle install here.