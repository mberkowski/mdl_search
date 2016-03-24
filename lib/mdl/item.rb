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

    private

    def format
      record.fetch(:format)
    end

    def method_missing(name, *args, &block)
      record_fields.include?(name) ? record.fetch(name) : super
    end

    private

    def record_fields
      [:original_file_uri, :collection, :id, :scalable_image_uri]
    end

    # Give hints as to how to theme/visualize this item
    # Viewers: audio, image, pdf
    def viewer_mapping
      {
        'image/jp2' => 'image',
        'mp3' => 'audio',
        'jp2' => 'image',
        'jpg' => 'image',
        'pdf' => 'pdf',
        'pdfpage' => 'pdf'
      }
    end
  end
end
