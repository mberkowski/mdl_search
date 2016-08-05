require 'open-uri'
require 'zlib'
require 'fileutils'

module Sunrise
  module SetupHelper

    class SolrCore
      attr_reader :repo,
                  :org,
                  :version,
                  :name,
                  :example_data_uri,
                  :dir,
                  :client

      def initialize(repo: '',
                     version: '',
                     org: '',
                     name: '',
                     example_data_uri: false,
                     dir: './cores')
        @repo = repo
        @org = org
        @version = version
        @name = name
        @example_data_uri = example_data_uri
        @dir = dir
      end

      def run!
        # if File.directory? dir
        #   puts "Cores directory #{dir} has already been created"
        #   return
        # end
        init_core_dir!
        initialize_cores!          
      end

      private

      def init_core_dir!
        FileUtils.mkdir_p dir
      end

      def initialize_cores!
        # save_core!
        # untar!("#{repo}-#{version}", core_0_path)
        # # A second core is created to allow for hot swapping of cores
        # untar!("#{repo}-#{version}", core_1_path)


        save_example_data!
        FileUtils.chmod_R 0777, dir
      end

      def save_core!
        save_tarball(github_uri)
      end

      def save_example_data!
        if example_data_uri
          save_tarball(example_data_uri)
          untar!('data', core_0_path)
          untar!('data', core_1_path)
        end
      end


      def save_tarball(uri)
        open("data.tar", 'w') do |local_file|
          puts "Downloading: #{uri}"
          open(uri) do |remote_file|
            local_file.write(Zlib::GzipReader.new(remote_file).read)
          end
        end
      end

      def github_uri
        "https://codeload.github.com/#{org}/#{repo}/tar.gz/#{version}"
      end

      def request(uri)
        client.get_response(URI(uri)).body
      end

      def untar!(filename, dest_path)
        puts "tar -xvf data.tar; mv #{filename} #{dest_path}"
        `tar -xvf data.tar; mv #{filename} #{dest_path}`
      end

      def core_0_path
        File.join([dir, "#{name}-0"])
      end

      def core_1_path
        File.join([dir, "#{name}-1"])
      end

    end
  end
end