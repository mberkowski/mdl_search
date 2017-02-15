require_relative '../../../lib/mdl/borealis_asset.rb'
require_relative '../../../lib/mdl/borealis_open_seadragon.rb'
require_relative '../../../lib/mdl/borealis_assets_to_viewers.rb'
require_relative '../../../lib/mdl/borealis_image.rb'
require_relative '../../../lib/mdl/borealis_video.rb'

module MDL
  describe BorealisAssetsToViewers do

    let(:assets) do
      [
        MDL::BorealisImage.new(collection: 'foo', id: 1, title: 'blah', transcript: 'Image One'),
        MDL::BorealisVideo.new(collection: 'foo', id: 5, transcript: 'Video One'),
        MDL::BorealisImage.new(collection: 'foo', id: 2, title: 'blah', transcript: 'Image Two')
      ]
    end

    it 'produces a configuration for the borealis player' do
      expect(MDL::BorealisAssetsToViewers.new(assets: assets).viewers).to eq ({
        "video" => {
          "type"=>"video",
          "thumbnail"=>"/thumbnails/foo:5",
          "height"=>500,
          "width"=>500,
          "src"=>"http://reflections.mndigital.org/utils/getstream/collection/foo/id/5",
          "transcript"=> {
            "label"=>"Video",
            "texts"=>["Video One"]
          }
        },
        "image" => {
          "type"=>"image",
          "thumbnail"=>"/thumbnails/foo:1",
          "label"=>"Image",
          "include_controls"=>true,
          "sequenceMode"=>true,
          "showReferenceStrip"=>true,
          "defaultZoomLevel"=>0,
          "tileSources"=> [
            "/contentdm-images/info?id=foo:1",
            "/contentdm-images/info?id=foo:2"
          ],
          "transcript" => {
            "texts"=> ["Image One", "Image Two"],
            "label"=> "Image"
          },
          "tocs" => ["blah", "blah"]
          }
         }
        )
    end
  end
end