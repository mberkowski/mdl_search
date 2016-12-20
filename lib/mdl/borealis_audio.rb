module MDL
  class BorealisAudio <  BorealisAsset
    def src
      "http://reflections.mndigital.org/utils/getstream/collection/#{collection}/id/#{id}"
    end

    def downloads
        []
    end

    def to_viewer
      {
        "focus" => false,
        "type" => "audio",
        "thumbnail" => thumbnail,
        "items" => [
          {
            "type" => "audio",
            "label" => "Audio",
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