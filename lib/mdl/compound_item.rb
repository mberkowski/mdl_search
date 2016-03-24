require 'digest/sha1'
require 'json'

module MDL
  class CompoundItem < Item
    attr_reader :record

    def thumbnail
      "http://reflections.mndigital.org/utils/getthumbnail/collection/#{collection}/id/#{item_id}"
    end

    def format
      record[:pagefile].split('.').last
    end

    def pagefile
      record[:pagefile]
    end

    def item_id
      record[:pageptr]
    end
  end
end