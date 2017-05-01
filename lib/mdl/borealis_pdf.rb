module MDL
  class BorealisPDF <  BorealisAsset
    def src
      "http://cdm16022.contentdm.oclc.org/utils/getfile/collection/#{collection}/id/#{id}/filename"
    end

    def downloads
      [src: "http://cdm16022.contentdm.oclc.org/utils/getfile/collection/#{collection}/id/#{id}/filename", label: 'Download']
    end

    def type
      'pdf'
    end

    def to_viewer
      {
        "type" => type,
        "height" => 800,
        "thumbnail" => thumbnail,
        "src" => src,
        "transcript" => {
          "label" => "PDF",
          "texts" => transcripts
        }
      }
    end
  end
end