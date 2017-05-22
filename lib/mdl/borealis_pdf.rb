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

    # PDF viewer requires multiple PDFs, so no to_viewer method here. See
    # borealis_pdf_viewer instead
    def viewer
      MDL::BorealisPDFViewer
    end
  end
end