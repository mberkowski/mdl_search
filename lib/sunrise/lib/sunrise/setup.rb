module Sunrise
  module SetupHelper

    def setup_solr(env, port, solr_version, solr_core_repo, solr_core_name, solr_core_version)
      solr = {
        url: "http://mirrors.advancedhosters.com/apache/lucene/solr/#{solr_version}/solr-#{solr_version}.tgz",
        core_url: "https://github.com/#{solr_core_repo}/archive/#{solr_core_version}.tar.gz",
        dir: "solr_#{env}"
      }

      sh "mkdir #{solr[:dir]}" if !File.directory? solr[:dir]

      if !File.directory? "#{solr[:dir]}/solr-#{solr_version}"
        puts "Downloading Solr version #{solr_version}"
        solr_archive = RestClient.get solr[:url]
        untar solr_archive, solr[:dir], 'solr'
      end

      if !File.directory? "#{solr[:dir]}/#{solr_core_name}-solr-core-#{solr_core_version}"
        puts "Downloading #{solr_core_name} core v##{solr_core_version}"
        solr_core = RestClient.get solr[:core_url]
        untar solr_core, solr[:dir], solr_core_name
      end

      symlink_core(solr[:dir], solr_version, solr_core_name, solr_core_version)

      sh "nohup #{solr[:dir]}/solr-#{solr_version}/bin/solr start -p #{port} &"
    end

    def symlink_core(solr_dir, solr_version, solr_core_name, solr_core_version)

      sh "ln -nsf #{Rails.root}/#{solr_dir}/#{solr_core_name}-solr-core-#{solr_core_version}/ #{Rails.root}/#{solr_dir}/solr-#{solr_version}/server/solr/#{solr_core_name}"
    end

    def untar(data, dir, filename)
      open("#{dir}/#{filename}.tar.gz", 'wb')  do |file|
        file.write(data)
        file.close()
      end
      sh "cd #{dir}; tar -xzvf #{filename}.tar.gz"
    end
  end
end
