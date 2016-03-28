require 'erb'

module MDL
  class Asset
    attr_reader :document
    def initialize(document)
      @document = document
    end

    def viewer
      viewer_mapping.fetch(format, 'image')
    end

    def thumbnail
      "/thumbnails/#{collection}/#{id}"
    end

    def id
      ids.last
    end

    def collection
      ids.first
    end

    def filename
      document[:id].gsub(':', '-')
    end

    private

    def ids
      document[:id].split(':')
    end

    def format
      document.fetch(:format)
    end

    # Give hints as to how to theme/visualize this item
    # Viewers: audio, image, pdf
    def viewer_mapping
      {
        'image/jp2' => 'image',
        'mp3' => 'audio',
        'mp4' => 'video',
        'video/mp4' => 'video',
        'jp2' => 'image',
        'jpg' => 'image',
        'pdf' => 'pdf',
        'pdfpage' => 'pdf'
      }
    end
  end
end
