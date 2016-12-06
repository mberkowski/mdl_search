require 'net/http'
require 'uri'
module CDMBL
  class CompletedCallback
    def self.call!(solr_client)
      Rails.logger.info "Swapping Solr Cores Following Indexing Status: #{solr_client.inspect}"
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