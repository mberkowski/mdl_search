module MDL
  class BorealisAsset
    attr_reader :id, :collection, :transcript, :title
    attr_accessor :focus
    def initialize(id: '', collection: '', transcript: false, title: false)
      @id          = id
      @collection  = collection
      @transcript  = sanitize_field(transcript)
      @title       = sanitize_field(title)
    end

    def thumbnail
      "/thumbnails/#{collection}:#{id}"
    end

    private

    def sanitize_field(field)
      (field == {} || field == false) ? '' : field
    end
  end
end