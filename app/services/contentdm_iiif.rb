require 'net/http'

class ContentdmIIIF
  attr_accessor :base_url, :collection, :id
  def initialize(base_url: 'http://reflections.mndigital.org', 
                 collection: '',
                 id: '')
    @base_url   = base_url
    @collection = collection
    @id         = id
  end

  def info
    contentdm_info.merge(local_info)
  end

  def contentdm_info
    JSON.parse(Net::HTTP.get_response(info_uri).body)
  end

  def local_info
    {
      "@id" => "#{base_url}/digital/iiif/#{collection}/#{id}",
    }
  end

  def info_uri
    URI("#{base_url}/digital/iiif/#{collection}/#{id}/info.json")
  end
end


    # {
    #   "@context" => "http://iiif.io/api/image/2/context.json",
    #   "@id" => "#{base_url}/digital/iiif/#{collection}/#{id}",
    #   "protocol" => "http://iiif.io/api/image",
    #   "width" => 10000,
    #   "height" => 10000,
    #   "sizes" => [
    #     {"width" => 100, "height" => 100},
    #     {"width" => 200, "height" => 200},
    #     {"width" => 300, "height" => 300},
    #     {"width" => 500, "height" => 500},
    #     {"width" => 800, "height" => 800},
    #     {"width" => 1300, "height" => 1300},
    #     {"width" => 2100, "height" => 2100},
    #     {"width" => 3400, "height" => 3400},
    #     {"width" => 5500, "height" => 5500},
    #     {"width" => 8900, "height" => 8900},
    #     {"width" => 10000, "height" => 10000}        
    #   ],
    #   "tiles"=> [
    #     {"width" => 512, "scaleFactors" => [1,2,4,8,16]}
    #   ],
    #   "profile" => [
    #     "http://iiif.io/api/image/2/level2.json",
    #     {
    #       "formats" => [ "gif", "pdf" ],
    #       "qualities" => [ "color", "gray" ],
    #     }
    #   ],
    # }