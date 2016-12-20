
namespace :mdl_ingester do

  desc "ingest content"
  ##
  # e.g. rake mdl_ingester:ingest[2015-09-14, 2]
  task :ingest, [:minimum_date, :batch_size] => :environment  do |t,args|
    minimum_date = (args[:minimum_date]) ? args[:minimum_date] : IndexingRunner.last_indexing_run
    base_url = (ENV['RAILS_ENV'] == 'production') ? 'http://localhost' : 'http://solr'
    solr_config = { url: "#{base_url}:8983/solr/mdl-1"}
    etl_config  = { oai_endpoint: 'http://reflections.mndigital.org/oai/oai.php',
                    cdm_endpoint: 'https://server16022.contentdm.oclc.org/dmwebservices/index.php',
                    minimum_date: minimum_date,
                    resumption_token: 'p16022coll36:1960:oclc-cdm-allsets:2015-09-14:9999-99-99:oai_dc' }
    batch_size = (args[:batch_size]) ? args[:batch_size].to_i : 10
    CDMBL::ETLWorker.perform_async(solr_config, etl_config, batch_size, true)
  end

end



