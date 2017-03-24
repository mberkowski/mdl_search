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
          "type"=>"audio",
          "thumbnail"=>"/thumbnails/foo:21",
          "transcript"=> {
            "label"=>"Audio",
            "texts"=> ["Audio transcript here"]
          },
          "flashvars" => {"streamerType"=>"auto", "playlistAPI.kpl0Id"=>nil},
          "height" => "395px",
          "targetId" => "kaltura_player_1489684320",
          "thumbnail" => "https://cdm16022.contentdm.oclc.org/utils/getthumbnail/collection/foo/id/21",
          "transcript" => {"texts"=>["Audio transcript here"], "label"=>"Audio Playlist"},
          "type" => "kaltura_audio_playlist",
          "uiconf_id" => 38719361,
          "wid" => "_1369852",
          "width" => "560px"
        }
      )
    end
  end
end

