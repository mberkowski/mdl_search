set :domain, "swadm@mtx-reflectqa-qat.oit.umn.edu"

role :app, "swadm@mtx-reflectqa-qat.oit.umn.edu"
role :web, "swadm@mtx-reflectqa-qat.oit.umn.edu"
role :db, "swadm@mtx-reflectqa-qat.oit.umn.edu", primary: true

set :ssh_options, {:forward_agent => true}

set :deploy_to, '/swadm/var/www/mtx-reflectqa-qat.oit.umn.edu'
set :use_sudo, false

set :linked_dirs, %w(app/assets/images/thumbnails log public/assets tmp/pids tmp/sockets)

set :rails_env, "production"

set :bundle_flags, '--deployment'

set :branch, 'upgrade/5.1'

set :sidekiq_concurrency, 1
set :sidekiq_processes, 2

set :keep_releases, 2
set :passenger_restart_with_touch, true