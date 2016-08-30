# MDL Search

An implementation of the [Blacklight Search](http://projectblacklight.org/) platform.

**Note:** tested only on Ubuntu 16.04. Please file an issue if this build does not work for you.

# Developer Quickstart

* [Install Docker](https://docs.docker.com/engine/installation)
* [Install Docker Compose](https://docs.docker.com/compose/)
* `$ git clone git@github.com:UMNLibraries/mdl_search.git`
* `$ cd mdl_search`
* `$ docker-compose run solr_setup`
* `$ docker-compose up`
* `$ docker-compose run web rake db:migrate`
