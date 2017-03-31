module MDL
  class Thumbnail
    attr_accessor :collection, :id, :cache_dir, :title, :type
    def initialize(collection: :missing_collection,
                   id: :missing_id,
                   cache_dir: File.join(Rails.root, 'thumbnails'),
                   title: '',
                   type: '')
      @collection = collection
      @id         = id
      @cache_dir  = cache_dir
      @title      = title
      @type       = type
    end

    def thumbnail_url
      case thumbnail_type
      when :sound
        'https://d1kue88aredzk1.cloudfront.net/audio-3.png'
      when :video
        'https://d1kue88aredzk1.cloudfront.net/video.jpg'
      when :contentdm
        "http://cdm16022.contentdm.oclc.org/utils/getthumbnail/collection/#{collection}/id/#{id}"
      end
    end

    def save
      File.open("#{cache_dir}/#{filename}", 'wb') { |file| file.write(data)}
    end

    def cached?
      File.exists?("#{cache_dir}/#{filename}")
    end

    def data
      @data ||= Net::HTTP.get_response(URI(thumbnail_url)).body
    end

    def cached_file
      File.read("#{cache_dir}/#{filename}")
    end

    private

    def thumbnail_type
      case type
      when 'Sound Recording Nonmusical'
        :sound
      when 'Moving Image'
        :video
      else
        :contentdm
      end
    end

    def filename
      "#{collection}_#{id}.jpg"
    end
  end
end