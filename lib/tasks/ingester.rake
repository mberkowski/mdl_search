
namespace :mdl_ingester do

  desc "ingest content"
  task :ingest, [:minimum_date] => :environment  do |t,args|
    minimum_date = (args[:minimum_date]) ? args[:minimum_date] : IndexingRunner.last_indexing_run
    solr_config = { url: 'http://solr:8983'}
    etl_config  = { oai_endpoint: 'http://reflections.mndigital.org/oai/oai.php',
                    cdm_endpoint: 'https://server16022.contentdm.oclc.org/dmwebservices/index.php',
                    minimum_date: minimum_date }
    CDMBL::ETLWorker.perform_async(solr_config, etl_config, false)
  end

end



