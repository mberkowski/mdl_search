require 'rails_helper'
require 'digest/sha1'

describe 'Browsing Homepage Map' do
  let (:minn_coords) {
    [
      '45.01706, -93.09961',
      '46.80611, -92.243896',
      '44.02917, -92.75278',
      '45.75194, -95.61806',
      '46.86525, -96.82899',
      '47.51583, -92.50694',
      '43.86944, -95.11833'
    ]
  }

  let(:solr_docs) {
    docs = []
    minn_coords.map do |coords|
      docs << SolrDocument.new({
        id: Digest::SHA1.hexdigest(coords),
        title_ssi: 'The Model C.C.C., January 17, 1935',
        type_ssi: 'Still Image',
        format_ssi: "image/jp2",
        coordinates_llsi: coords
      }).to_h
    end
    docs
  }

  before(:each) { @routes = Blacklight::Engine.routes }

  before do
    Blacklight.default_index.connection.tap do |solr|
      solr.delete_by_query("*:*", params: { commit: true })
      solr.add solr_docs
      solr.commit
    end
  end

    it 'pins records to the home page map and allows users to navigate to them', :js => true do
      visit '/'
      first('.leaflet-marker-pane img').click
      expect(find('#home_map')).to have_content('The Model C.C.C., January 17, 1935')
    end
end

