module MDL

  class BorealisOpenSeadragon
    attr_reader :images
    attr_accessor :focus
    def initialize(images: [])
      @images = images
    end

    def to_viewer
      {
        "focus" => true,
        "type" => "image",
        "thumbnail" => images.first.thumbnail,      
        "items" => [
          {
            "type" => "image",
            "label" => "Image",
            "focus" => true,
            "include_controls" => true,
            "sequenceMode" => true,
            "showReferenceStrip" => true,
            "defaultZoomLevel" => 0,
            "tileSources" => images.map { |img| img.src }
          },
          {
            "type" => "transcript",
            "label" => "Transcript",
            "texts" => images.map { |img| img.transcript },
            "focus" => false
          }
        ],
        "tocs" => images.map { |img| img.title }
      }
    end


  end
end