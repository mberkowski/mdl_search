module Sunrise
  module TeardownHelper
    def teardown_solr(port, env, solr_version)
      sh "solr_#{env}/solr-#{solr_version}/bin/solr stop -all"
    end
  end
end
