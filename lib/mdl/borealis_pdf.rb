module MDL
  class BorealisPDF <  BorealisAsset
    def src
      "http://reflections.mndigital.org/utils/getfile/collection/#{collection}/id/#{id}/filename/#{id}.pdf"
    end

    def downloads
      [src: "http://reflections.mndigital.org/utils/getfile/collection/#{collection}/id/#{id}/filename/#{id}.pdf", label: 'Download']
    end

    def to_viewer
      {
        "focus" => false,
        "type" => "pdf",
        "height" => 800,
        "thumbnail" => thumbnail,
        "items" => [
          {
            "type" => "pdf",
            "label" => "PDF",
            "focus" => true,
            "src" => src,
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