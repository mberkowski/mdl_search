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
        "type" => "audio",
        "thumbnail" => thumbnail,
        "src" => src,
        "transcript" => {
            "label" => "Audio",
            "texts" => transcripts
        }
      }
    end
  end
end