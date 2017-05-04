require 'rails_helper'

describe 'Browsing Homepage Map' do
  let(:solr_docs) {
    docs = []
    docs << SolrDocument.new({
      id: 'mhs:5469',
      title_ssi: 'The Model C.C.C., January 17, 1935',
      type_ssi: 'Still Image',
      format_ssi: "image/jp2",
      coordinates_llsi: '45.00458, -93.47688'
    }).to_h

    docs << SolrDocument.new({
      id: 'lrl:2612',
      title_ssi: 'Senator George Albert Turnham, 1919-1920 Legislative Session, Minnesota Legislature',
      type_ssi: 'Still Image',
      format_ssi: "image/jp2",
      coordinates_llsi: '44.98528, -93.56889'
    }).to_h


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
      # Visit the full record view of this item
      first('.leaflet-popup-content a').click
      expect(find('#home_map')).to have_content('The Model C.C.C., January 17, 1935')
      # Make sure we have navigated to the full record view
      find('.blacklight-catalog-show')
    end
end

