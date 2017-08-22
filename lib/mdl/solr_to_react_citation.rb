
# Transform a solr document to a React Citation Hash
class SolrToReactCitation
  attr_reader :solr_doc,
              :cite_details,
              :cite_citation,
              :cite_download,
              :cite_transcript

  def initialize(solr_doc: {},
                 cite_details: MDL::CiteDetails,
                 cite_citation: MDL::CiteCitation,
                 cite_download: MDL::CiteDownload,
                 cite_transcript: MDL::CiteTranscript)

    @solr_doc        = solr_doc
    @cite_details    = cite_details
    @cite_citation   = cite_citation
    @cite_download   = cite_download
    @cite_transcript = cite_transcript
  end

  def items
    transform.map { |item| (!item.empty?) ? item : nil }.compact
  end

  private

  def transform
    transformers.inject([]) { |tranformer| tranformer.new(solr_doc).to_hash }
  end

  def transformers
    [
      cite_details,
      cite_citation,
      cite_download,
      cite_transcript
    ]
  end
end