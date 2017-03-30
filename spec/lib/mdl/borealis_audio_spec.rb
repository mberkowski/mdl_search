require_relative '../../../lib/mdl/borealis_asset.rb'
require_relative '../../../lib/mdl/borealis_audio.rb'
module MDL
  describe BorealisAudio do
    let(:audio_document) { {"kaltura_audio_ssi" => "foo_bar"} }
    let(:audio_playlist_document) { {"kaltura_audio_playlist_ssi" => "foo_bar"} }
    let(:playlist_with_audio) { {"kaltura_audio_playlist_ssi" => "foo_bar", "kaltura_audio_ssi" => "foo;bar;baz"} }

    it 'correctly identifies its downloads' do
      expect(BorealisAudio.new.downloads).to eq []
    end

    it 'produces a kaltura audio player hash' do
      asset = BorealisAudio.new(document: audio_document, id: 1, collection: 'brah')
      expect(asset.to_viewer).to eq (
        {
          "entry_id" => "foo_bar",
          "height" => "70px",
          "targetId" => "kaltura_player",
          "thumbnail" => "https://d1kue88aredzk1.cloudfront.net/audio.jpg",
          "transcript" => {"texts"=>[], "label"=>"Audio"},
          "type" => "kaltura_audio",
          "uiconf_id" => 38708801,
          "wid" => "_1369852",
          "width" => "460px"
        }
      )
    end
    it 'produces a kaltura audio playlist hash' do
      asset = BorealisAudio.new(document: audio_playlist_document, id: 1, collection: 'brah')
      expect(asset.to_viewer).to eq (
        {
          "flashvars" => {"streamerType"=>"auto", "playlistAPI.kpl0Id"=>"foo_bar"},
           "height" => "395px",
           "targetId" => "kaltura_player_playlist",
           "thumbnail" => "https://d1kue88aredzk1.cloudfront.net/audio.jpg",
           "transcript" => {"texts"=>[], "label"=>"Audio Playlist"},
           "type" => "kaltura_audio_playlist",
           "uiconf_id" => 38719361,
           "wid" => "_1369852",
           "width" => "560px"
        }
      )
    end

    describe "when audio ids and playlists are provided" do
      it 'produces a kaltura audio playlist hash' do
        asset = BorealisAudio.new(document: playlist_with_audio, id: 1, collection: 'brah')
        expect(asset.to_viewer).to eq (
          {
            "flashvars" => {"streamerType"=>"auto", "playlistAPI.kpl0Id"=>"foo_bar"},
             "height" => "395px",
             "targetId" => "kaltura_player_playlist",
             "thumbnail" => "https://d1kue88aredzk1.cloudfront.net/audio.jpg",
             "transcript" => {"texts"=>[], "label"=>"Audio Playlist"},
             "type" => "kaltura_audio_playlist",
             "uiconf_id" => 38719361,
             "wid" => "_1369852",
             "width" => "560px"
          }
        )
      end
    end
  end
end

