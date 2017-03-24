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
        "kaltura_video" => {"type"=>"kaltura_video", "targetId"=>"kaltura_player_1489614720", "wid"=>"_1369852", "uiconf_id"=>38683631, "transcript"=>{"texts"=>["Video One"], "label"=>"Video"}, "entry_id"=>nil, "height"=>"315px", "width"=>"560px", "thumbnail"=>"https://cdm16022.contentdm.oclc.org/utils/getthumbnail/collection/foo/id/5"},
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