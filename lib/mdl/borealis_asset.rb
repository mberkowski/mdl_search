module MDL
  class BorealisAsset
    attr_reader :id, :collection, :format
    attr_accessor :focus
    def initialize(id: '', collection: '', format: 'image/jp2')
      @id         = id
      @collection = collection
      @format     = sanitize(format)
    end

    def src
      case type
      when 'image'
        "/contentdm-images/info?id=#{collection}:#{id}"
      when 'audio'
        "http://reflections.mndigital.org/utils/getstream/collection/#{collection}/id/#{id}"
      when 'video'
        "http://reflections.mndigital.org/utils/getstream/collection/#{collection}/id/#{id}"
      when 'pdf'
        "http://reflections.mndigital.org/utils/getfile/collection/#{collection}/id/#{id}"
      end
    end

    def thumbnail
      "/thumbnails/#{collection}:#{id}"
    end

    def type
      viewer_mapping[format]
    end

    private

    def sanitize(format)
      format.gsub(/;/, '')
    end

    def viewer_mapping
      {
        'image/jp2' => 'image',
        'tif' => 'image',
        'mp3' => 'audio',
        'mp4' => 'video',
        'video/DV' => 'video',
        'video/mp4' => 'video',
        'jp2' => 'image',
        'jpg' => 'image',
        'pdf' => 'pdf',
        'pdfpage' => 'pdf'
      }
    end
  end
end