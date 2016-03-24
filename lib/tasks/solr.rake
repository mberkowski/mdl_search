require "#{Rails.root}/lib/sunrise/lib/sunrise"

namespace :solr do
  include Sunrise::SetupHelper

  desc "download, unpack, and run Test Solr instance"
  task :setup_test do
    setup_solr('test', '8983', '5.5.0', 'UMNLibraries/mdl-solr-core', 'mdl', 'master')
  end

  desc "download, unpack, and run Production Solr instance"
  task :setup_prod do
    setup_solr('prod', '8983', '5.5.0', 'UMNLibraries/mdl-solr-core', 'mdl', 'master')
  end
end
