module MDL
  class Item
    attr_reader :record
    def initialize(record)
      @record = record
    end

    def viewer
      viewer_mapping.fetch(format, 'image')
    end

    def thumbnail
      "http://reflections.mndigital.org/utils/getthumbnail/collection/#{collection}/id/#{id}"
    end

    def id
      record[:id].split(':').last
    end

    def collection
      record[:id].split(':').first
    end

    def page_id
      id
    end

    def filename
      record[:id].gsub(':', '-')
    end

    private

    def format
      record.fetch(:format)
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
