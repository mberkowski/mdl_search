set :domain, "swadm@lib-mdl-dev.oit.umn.edu"

role :app, "swadm@lib-mdl-dev.oit.umn.edu"
role :web, "swadm@lib-mdl-dev.oit.umn.edu"
role :db, "swadm@lib-mdl-dev.oit.umn.edu", primary: true

set :ssh_options, {:forward_agent => true}

set :deploy_to, '/swadm/var/www/html/mdl'
set :use_sudo, false

# set :linked_dirs, fetch(:linked_dirs) + %w(public/uploads public/embeds log cache tmp solr_prod)

set :rails_env, "production"

set :bundle_flags, '--deployment'

namespace :deploy do
  desc "Restart Application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, "#{release_path}/tmp/restart.txt"
    end
  end

  desc "Start Solr instance"
  task :start_solr do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "solr:setup_prod"
        end
      end
    end
  end

  after 'deploy:updated', 'deploy:start_solr'
  after :publishing, :restart
end
