require 'net/http'
require 'uri'
module CDM2Solr
  class CompletedCallback
    def self.call!
      Rails.logger.info "Swapping Solr Cores Following Indexing Status: #{Net::HTTP.get_response(URI(ENV['SOLR_URL']))}"
    end
  end

  class OaiNotification
    def self.call!(location)
      Rails.logger.info "CDMBL: Requesting: #{location}"
    end
  end

  class CdmNotification
    def self.call!(collection, id, endpoint)
      Rails.logger.info "CDMBL: Requesting: #{collection}:#{id} from #{endpoint}"
    end
  end
end