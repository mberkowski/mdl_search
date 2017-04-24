module MDL

  class BorealisOpenSeadragon
    attr_reader :images
    attr_accessor :focus
    def initialize(images: [])
      @images = [images].flatten
    end

    def type
      'image'
    end

    def to_viewer
      {
        "type" => type,
        "thumbnail" => images.first.thumbnail,
        "label" => "Image",
        "include_controls" => true,
        "sequenceMode" => true,
        "showReferenceStrip" => true,
        "defaultZoomLevel" => 0,
        "tileSources" => images.map { |img| img.src },
        "transcript" => {
          "texts" => images.map do |img|
            img.transcripts if img.transcripts != ''
          end.flatten.compact.uniq,
          "label" => "Image"
        },
        "tocs" => images.map { |img| img.title }
      }
    end


  end
end