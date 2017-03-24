module MDL
  class BorealisAsset
    attr_reader :id, :collection, :transcripts, :title, :document
    attr_accessor :focus
    def initialize(id: '',
                   collection: '',
                   transcript: false,
                   title: false,
                   document: {})
      @id           = id
      @collection   = collection
      @transcripts  = [sanitize_field(transcript)].compact
      @title        = sanitize_field(title)
      @document     = document
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