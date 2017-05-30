module MDL
  class BorealisPDF <  BorealisAsset
     def src
      if is_child?
        "http://cdm16022.contentdm.oclc.org/utils/getfile/collection/#{collection}/id/#{id}/filename"
      else
        "http://cdm16022.contentdm.oclc.org/utils/getfile/collection/#{collection}/id/#{parent_id}/filename/#{id}"
      end
    end

    def downloads
      [src: src, label: 'Download']
    end

    def is_child?
      parent_id != id
    end

    def type
      'pdf'
    end

    def parent_id
      document['id'].split(':').last
    end

    # PDF viewer requires multiple PDFs, so no to_viewer method here. See
    # borealis_pdf_viewer instead
    def viewer
      MDL::BorealisPDFViewer
    end
  end
end