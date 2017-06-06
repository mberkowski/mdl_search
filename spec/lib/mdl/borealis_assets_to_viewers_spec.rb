require_relative '../../../lib/mdl/borealis_assets_viewer.rb'
require_relative '../../../lib/mdl/borealis_asset.rb'
require_relative '../../../lib/mdl/borealis_image.rb'
require_relative '../../../lib/mdl/borealis_video.rb'
require_relative '../../../lib/mdl/borealis_video_player.rb'
require_relative '../../../lib/mdl/borealis_open_seadragon.rb'
require_relative '../../../lib/mdl/borealis_asset_to_viewer.rb'
require_relative '../../../lib/mdl/borealis_assets_to_viewers.rb'

module MDL
  describe BorealisAssetsToViewers do
    let(:images) do
      [
        MDL::BorealisImage.new(collection: 'images',
                               id: 1,
                               title: 'blah',
                               transcript: 'Image One'),
        MDL::BorealisImage.new(collection: 'images',
                               id: 2,
                               title: 'blah',
                               transcript: 'Image Two')
      ]
    end

    it 'produces a configuration for Images (OpenSeadragon)' do
      expect(to_viewers(images)).to eq(
        'image' => {
          'type' => 'image',
          'thumbnail' => '/thumbnails/images:1',
          'label' => 'Image',
          'include_controls' => true,
          'sequenceMode' => true,
          'showReferenceStrip' => true,
          'defaultZoomLevel' => 0,
          'minZoomLevel' => 0,
          'tileSources' => [
            '/contentdm-images/info?id=images:1',
            '/contentdm-images/info?id=images:2'
          ],
          'transcript' => {
            'texts' => ['Image One', 'Image Two'],
            'label' => 'Image'
          },
          'tocs' => %w[blah blah]
        }
      )
    end

    def to_viewers(assets)
      MDL::BorealisAssetsToViewers.new(assets: assets).viewers
    end
  end
end
