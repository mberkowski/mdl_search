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
        "type" => "video",
        "thumbnail" => thumbnail,
        "height" => 500,
        "width" => 500,
        "src" => src,
        "transcript" => {
            "label" => "Video",
            "texts" => transcripts
        }
      }
    end

  end
end