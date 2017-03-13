module MDL
  class BorealisPPT <  BorealisAsset
    def src
      "http://reflections.mndigital.org/utils/getfile/collection/#{collection}/id/#{id}/filename/#{pagefile}"
    end

    def downloads
      []
    end

    def to_viewer
      {
        "type" => "ppt",
        "thumbnail" => thumbnail,
        "src" => src,
        "text" => "(Download)",
        "transcript" => {
          "label" => "PowerPoint",
          "texts" => []
        }
      }
    end
  end
end