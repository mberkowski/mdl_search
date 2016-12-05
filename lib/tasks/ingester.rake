
namespace :mdl_ingester do

  desc "ingest content"
  ##
  # e.g. rake mdl_ingester:ingest[2015-09-14]
  task :ingest, [:minimum_date] => :environment  do |t,args|
    minimum_date = (args[:minimum_date]) ? args[:minimum_date] : IndexingRunner.last_indexing_run
    base_url = (ENV['RAILS_ENV'] == 'production') ? 'http://localhost' : 'http://solr'
    solr_config = { url: "#{base_url}:8983/solr/mdl-1"}
    etl_config  = { oai_endpoint: 'http://reflections.mndigital.org/oai/oai.php',
                    cdm_endpoint: 'https://server16022.contentdm.oclc.org/dmwebservices/index.php',
                    minimum_date: minimum_date }
    etl_config = (args[:resumption_token]) ? etl_cofig.merge(args[:resumption_token]) : etl_config                    
    CDMBL::ETLWorker.perform_async(solr_config, etl_config, true)
  end

end



