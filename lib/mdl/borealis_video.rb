module MDL
  class BorealisVideo <  BorealisAsset

    def src
      "http://reflections.mndigital.org/utils/getstream/collection/#{collection}/id/#{id}"
    end

    def downloads
        []
    end

    def to_viewer
      {
        "focus" => false,
        "type" => "video",
        "thumbnail" => thumbnail,
        "items" => [
          {
            "type" => "video",
            "label" => "Video",
            "height" => 500,
            "width" => 500,
            "focus" => true,
            "src" => src
          },
          {
            "type" => "transcript",
            "label" => "Transcript",
            "texts" => [transcript],
            "focus" => false
          }
        ]    
      }
    end

  end
end