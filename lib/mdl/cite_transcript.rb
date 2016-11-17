module MDL
  class CiteTranscript
    attr_reader :solr_doc
    def initialize(solr_doc: {})
      @solr_doc = solr_doc
    end

    def to_hash
      if solr_doc['transcription_tesi']
        {
          focus: false,
          type: 'transcript',
          label: 'Transcript',
          transcript: solr_doc['transcription_tesi']
        }
      else
        {}
      end
    end
  end
end
