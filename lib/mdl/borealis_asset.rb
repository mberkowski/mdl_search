module MDL
  class BorealisAsset
    attr_reader :id, :collection, :pagefile, :transcripts, :title
    attr_accessor :focus
    def initialize(id: '', collection: '', pagefile: '', transcript: false, title: false)
      @id           = id
      @collection   = collection
      @transcripts  = [sanitize_field(transcript)].compact
      @title        = sanitize_field(title)
      @pagefile     = pagefile
    end

    def thumbnail
      "/thumbnails/#{collection}:#{id}"
    end

    private

    def sanitize_field(field)
      (field == {} || field == false || field == '') ? nil : field
    end
  end
end