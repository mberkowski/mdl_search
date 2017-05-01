module MDL
  class BorealisPPT <  BorealisAsset
    def src
      "http://cdm16022.contentdm.oclc.org/utils/getfile/collection/#{collection}/id/#{id}/filename"
    end

    def downloads
      []
    end

    def type
      'ppt'
    end

    def to_viewer
      {
        "type" => type,
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