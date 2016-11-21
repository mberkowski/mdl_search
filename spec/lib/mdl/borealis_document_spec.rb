require_relative '../../../lib/mdl/borealis_document.rb'
module MDL
  describe BorealisDocument do
    let(:asset_klass) { double }
    let(:document) { {id: 'coll123/123', format: 'video'} }
    context 'when the document is a single item' do
      it 'instantiates a single asset item' do
        expect(asset_klass).to receive(:new) { 'aseet_klass'  }.with(:id=>'123', :collection=>'coll123', :format=>'video')
        BorealisDocument.new(document: document, asset_klass: asset_klass).to_assets
      end
    end
    context 'when the document has compounds' do
      it 'instantiates an array of asset items' do
        expect(asset_klass).to receive(:new) { 'aseet_klass'  }.with({:id=>"123", :collection=>"coll123", :format=>"video"})
        compound = document.merge('compound_objects' => [:pagetitle=>'Sculpture, Side view', :pagefile=>'81.jp2', :pageptr=>'80'])
        BorealisDocument.new(document: compound, asset_klass: asset_klass).to_assets
      end
    end
  end
end