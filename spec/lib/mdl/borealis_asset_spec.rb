require_relative '../../../lib/mdl/borealis_asset.rb'
module MDL
  describe BorealisAsset do
    it 'correctly identifies its type' do
      asset =  BorealisAsset.new(id: '', collection: '', format: 'mp4')
      expect(asset.type).to eq 'video'
      expect(asset).to respond_to(:id, :collection, :format, :focus)
    end

    it 'responds to its api' do
      asset =  BorealisAsset.new(id: '', collection: '', format: '')
      expect(asset).to respond_to(:id, :collection, :format)
    end

    it 'produces the correct asset source for each type' do
      asset =  BorealisAsset.new(id: '1', collection: 'foo', format: 'jp2')
      expect(asset.src).to eq '/contentdm-images/info?id=foo/1'

      asset =  BorealisAsset.new(id: '1', collection: 'foo', format: 'mp4')
      expect(asset.src).to eq 'http://reflections.mndigital.org/utils/getstream/collection/foo/id/1'

      asset =  BorealisAsset.new(id: '1', collection: 'foo', format: 'pdf')
      expect(asset.src).to eq 'http://reflections.mndigital.org/utils/getfile/collection/foo/id/1'

      asset =  BorealisAsset.new(id: '1', collection: 'foo', format: 'mp3')
      expect(asset.src).to eq 'http://reflections.mndigital.org/utils/getstream/collection/foo/id/1'
    end

    it 'derives a thumbnail link' do
      asset =  BorealisAsset.new(id: '1', collection: 'foo', format: 'mp3')
      expect(asset.thumbnail).to eq '/thumbnails/foo/1'
    end
  end
end