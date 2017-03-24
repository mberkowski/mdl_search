require_relative '../../../lib/mdl/borealis_asset.rb'
require_relative '../../../lib/mdl/borealis_audio.rb'
module MDL
  describe BorealisAudio do
    let(:video) { MDL::BorealisAudio.new(collection: 'foo', id: 21, transcript: 'Audio transcript here') }

    it 'correctly identifies its downloads' do
      expect(video.downloads).to eq []
    end

    it 'serializes itself for use in the viewer' do
      expect(video.to_viewer).to eq (
        {
          "entry_id" => nil,
          "height" => "70px",
          "targetId" => "kaltura_player_1489599711",
          "thumbnail" => "https://cdm16022.contentdm.oclc.org/utils/getthumbnail/collection/foo/id/21",
          "transcript" => {"texts"=>["Audio transcript here"], "label"=>"Audio"},
          "type" => "kaltura_audio",
          "uiconf_id" => 38708801,
          "wid" => "_1369852",
          "width" => "460px"
        }
      )
    end
  end
end

