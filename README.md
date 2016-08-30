# MDL Search

An implementation of the [Blacklight Search](http://projectblacklight.org/) platform.

**Note:** tested only on Ubuntu 16.04. Please file an issue if this build does not work for you.

# Developer Quickstart

* [Install Docker](https://docs.docker.com/engine/installation)
* [Install Docker Group](https://docs.docker.com/engine/installation/linux/ubuntulinux/#/create-a-docker-group)
* [Install Docker Compose](https://docs.docker.com/compose/)
* `$ git clone git@github.com:UMNLibraries/mdl_search.git`
* `$ cd mdl_search`
* `$ mkdir thumbnails`
* `$ docker-compose run solr_setup`
* `$ docker-compose build`
* `$ docker-compose up`

Open another tab in your teminal and enter:

* `$ docker-compose run web rake db:migrate`

# Handy-Dandy Docker Commands


## Some aliases for your shell

```
# Show all docker images
alias dps='docker ps -a'

# Remove all inactive Docker images (ones that have "Exited")
alias drm='docker rm $(docker ps -a | grep Exited | awk '\''BEGIN { FS=" " } ; {print $1;}'\'')'

# Scorched earth! remove all Docker images
alias drmi='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
```

## Working with composed images

Enter an interactive session with the application:

`$ docker-compose exec web /bin/bash`



