require_relative '../../../lib/mdl/borealis_asset.rb'
require_relative '../../../lib/mdl/borealis_assets_viewer.rb'
require_relative '../../../lib/mdl/borealis_image.rb'
require_relative '../../../lib/mdl/borealis_open_seadragon.rb'

module MDL
  describe BorealisOpenSeadragon do
    let(:images) do
      [
        BorealisImage.new(collection: 'foo', id: '123', title: 'Page One', transcript: 'Page One stuff here'),
        BorealisImage.new(collection: 'foo', id: '312', title: 'Page Two', transcript: 'Page Two stuff here'),
        BorealisImage.new(collection: 'foo', id: '321', title: 'Page Three', transcript: 'Page Three stuff here')
      ]
    end

    let(:openseadragon) { BorealisOpenSeadragon.new(assets: images) }
    it 'correctly identifies its src' do
      expect(openseadragon.to_viewer).to eq (
        {
          'type'=>'image',
          'basename' => '',
          'thumbnail'=>'/thumbnails/foo:123',
          'tileSources' => ['/contentdm-images/info?id=foo:123', '/contentdm-images/info?id=foo:312', '/contentdm-images/info?id=foo:321'],
          'tocs' => ['Page One', 'Page Two', 'Page Three'],
          'transcript' => {'texts'=>['Page One stuff here', 'Page Two stuff here', 'Page Three stuff here'], 'label'=>'Image'},
          'label'=>'Image',
          'include_controls'=>true,
          'defaultZoomLevel' => 0,
          'minZoomLevel' => 0,
          'sequenceMode' => true,
          'showReferenceStrip' => true
        }
      )
    end

  end
end

