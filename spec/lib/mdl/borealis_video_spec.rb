require_relative '../../../lib/mdl/borealis_asset.rb'
require_relative '../../../lib/mdl/borealis_video.rb'
module MDL
  describe BorealisVideo do
    let(:video) { MDL::BorealisVideo.new(collection: 'foo', id: 21, transcript: 'Video transcript here') }
    it 'correctly identifies its src' do
      expect(video.src).to eq 'http://cdm16022.contentdm.oclc.org/utils/getstream/collection/foo/id/21'
    end

    it 'correctly identifies its downloads' do
      expect(video.downloads).to eq []
    end

    it 'serializes itself for use in the viewer' do
      expect(video.to_viewer).to eq (
        {
          "type"=>"video",
          "thumbnail"=>"/thumbnails/foo:21",
          "height"=>500,
          "width"=>500,
          "transcript"=>{
            "label"=>"Video",
            "texts"=>["Video transcript here"]
          },
          "entry_id" => nil,
          "height" => "315px",
          "targetId" => "kaltura_player_video",
          "thumbnail" => "https://d1kue88aredzk1.cloudfront.net/video-1.png",
          "transcript" => {"texts"=>["Video transcript here"], "label"=>"Video"},
          "type" => "kaltura_video",
          "uiconf_id" => 38683631,
          "wid" => "_1369852",
          "width" => "560px",
        })
    end
  end
end

