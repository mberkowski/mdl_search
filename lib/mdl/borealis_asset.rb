module MDL
  class BorealisAsset
    attr_reader :id, :collection, :format, :transcript
    attr_accessor :focus
    def initialize(id: '', collection: '', format: 'image/jp2', transcript: false)
      @id          = id
      @collection  = collection
      @format      = sanitize(format)
      @transcript = (transcript == {} || !transcript) ? '' : transcript
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
        "http://reflections.mndigital.org/utils/getfile/collection/#{collection}/id/#{id}/filename/#{id}.pdf"
      end
    end

    def downloads
      case type
      when 'image'
        [
          { src: "http://reflections.mndigital.org/digital/iiif/#{collection}/#{id}/full/150,150/0/default.jpg", label: '(150 x 150)' },
          { src: "http://reflections.mndigital.org/digital/iiif/#{collection}/#{id}/full/800,800/0/default.jpg", label: '(800 x 800)' },
          { src: "http://reflections.mndigital.org/digital/iiif/#{collection}/#{id}/full/1920,1920/0/default.jpg", label: '(1920 x 1920)' }
        ]
      when 'pdf'
        [src: "http://reflections.mndigital.org/utils/getfile/collection/#{collection}/id/#{id}/filename/#{id}.pdf", label: 'Download']
      else
        []
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
        'pdfpage' => 'pdf',
        'application/pdf' => 'pdf'
      }
    end
  end
end