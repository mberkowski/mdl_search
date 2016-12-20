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
      expect(MDL::BorealisAssetsToViewers.new(assets: assets).viewers).to eq ([{"focus"=>false,
                                                                   "type"=>"video",
                                                                   "thumbnail"=>"/thumbnails/foo:5",
                                                                   "items"=>
                                                                    [{"type"=>"video",
                                                                      "label"=>"Video",
                                                                      "height"=>500,
                                                                      "width"=>500,
                                                                      "focus"=>true,
                                                                      "src"=>
                                                                       "http://reflections.mndigital.org/utils/getstream/collection/foo/id/5"},
                                                                     {"type"=>"transcript",
                                                                      "label"=>"Transcript",
                                                                      "texts"=>["Video One"],
                                                                      "focus"=>false}]},
                                                                  {"focus"=>true,
                                                                   "type"=>"image",
                                                                   "thumbnail"=>"/thumbnails/foo:1",
                                                                   "items"=>
                                                                    [{"type"=>"image",
                                                                      "label"=>"Image",
                                                                      "focus"=>true,
                                                                      "include_controls"=>true,
                                                                      "sequenceMode"=>true,
                                                                      "showReferenceStrip"=>true,
                                                                      "defaultZoomLevel"=>0,
                                                                      "tileSources"=>
                                                                       ["/contentdm-images/info?id=foo:1", "/contentdm-images/info?id=foo:2"]},
                                                                     {"type"=>"transcript",
                                                                      "label"=>"Transcript",
                                                                      "texts"=>["Image One", "Image Two"],
                                                                      "focus"=>false}],
                                                                   "tocs"=>["blah", "blah"]}
                                                                  ])
    end
  end
end