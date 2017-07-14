set :domain, "deploy@mtx-discovery-dev.oit.umn.edu"

role :app, "deploy@mtx-discovery-dev.oit.umn.edu"
role :web, "deploy@mtx-discovery-dev.oit.umn.edu"
role :db, "deploy@mtx-discovery-dev.oit.umn.edu", primary: true

set :ssh_options, {:forward_agent => true}

set :deploy_to, '/swadm/var/www/mtx-discovery-dev.oit.umn.edu'
set :use_sudo, false

set :linked_dirs, %w(thumbnails log public/assets tmp/pids tmp/sockets)

set :rails_env, "production"

set :bundle_flags, '--deployment'

set :branch, 'upgrade/5.1'

set :sidekiq_concurrency, 1
set :sidekiq_processes, 2

set :passenger_restart_with_touch, true