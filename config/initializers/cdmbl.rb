require 'net/http'
require 'uri'
module CDM2Solr
  class Callback
    def self.call!
      Rails.logger.info "Swapping Solr Cores Following Indexing Status: #{Net::HTTP.get_response(URI(ENV['SOLR_URL']))}"
    end
  end
end