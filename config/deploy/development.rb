set :domain, "swadm@lib-mdl-dev.oit.umn.edu"

role :app, "swadm@lib-mdl-dev.oit.umn.edu"
role :web, "swadm@lib-mdl-dev.oit.umn.edu"
role :db, "swadm@lib-mdl-dev.oit.umn.edu", primary: true

set :ssh_options, {:forward_agent => true}

set :deploy_to, '/swadm/var/www/html/mdl'
set :use_sudo, false

set :linked_dirs, %w(thumbnails log public/assets tmp/pids tmp/sockets)

set :rails_env, "production"

set :bundle_flags, '--deployment'


set :sidekiq_concurrency, 1
set :sidekiq_processes, 2
