namespace :mdl_ingester do

  desc "ingest batches of records"
  ##
  # e.g. rake mdl_ingester:ingest[2015-09-14, 2]
  task :batch, [:minimum_date, :set_spec] => :environment  do |t,args|
    minimum_date = (args[:minimum_date]) ? args[:minimum_date] : IndexingRunner.last_indexing_run
    set_spec = (args[:set_spec] != '""') ? args[:set_spec] : false
    etl_config  = {
                    oai_endpoint: 'http://reflections.mndigital.org/oai/oai.php',
                    cdm_endpoint: 'https://server16022.contentdm.oclc.org/dmwebservices/index.php',
                    minimum_date: minimum_date
                   }
    etl_config.merge!('set_spec': set_spec) if set_spec
    CDMBL::ETLWorker.perform_async(solr_config, etl_config, true)
  end

  desc "ingest a single record"
  task :record, [:id] => :environment  do |t,args|
    collection, id = args['id'].split(':')
    oai_request = CDMBL::OaiRequest.new(base_uri: 'http://reflections.mndigital.org/oai/oai.php')
    extraction = CDMBL::Extractor.new(oai_request: oai_request,
                                      cdm_endpoint: 'https://server16022.contentdm.oclc.org/dmwebservices/index.php')
    records = [extraction.cdm_request(collection, id)]
    transformation = CDMBL::Transformer.new(cdm_records: records, oai_sets: extraction.set_lookup)
    CDMBL::Loader.new(records: transformation.records,
                      solr_client: CDMBL::Solr.new(solr_config)).load!
  end

  def solr_config
    { url: "#{base_url}:8983/solr/mdl-1"}
  end

  def base_url
    (ENV['RAILS_ENV'] == 'production') ? 'http://localhost' : 'http://solr'
  end
end



