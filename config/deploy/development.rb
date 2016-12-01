set :domain, "swadm@lib-mdl-dev.oit.umn.edu"

role :app, "swadm@lib-mdl-dev.oit.umn.edu"
role :web, "swadm@lib-mdl-dev.oit.umn.edu"
role :db, "swadm@lib-mdl-dev.oit.umn.edu", primary: true

set :ssh_options, {:forward_agent => true}

set :deploy_to, '/swadm/var/www/html/mdl'
set :use_sudo, false

set :linked_dirs, fetch(:linked_dirs) + %w(thumbnails cdm_images tmp log cache)

set :rails_env, "production"

set :bundle_flags, '--deployment'

# set :branch, 'reactify'