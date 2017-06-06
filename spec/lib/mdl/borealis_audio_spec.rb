require_relative '../../../lib/mdl/borealis_assets_viewer.rb'
require_relative '../../../lib/mdl/borealis_asset.rb'
require_relative '../../../lib/mdl/borealis_audio.rb'
require_relative '../../../lib/mdl/borealis_audio_player.rb'
module MDL
  describe BorealisAudio do
    let(:audio_document) { {"kaltura_audio_ssi" => "foo_bar"} }
    let(:audio_playlist_document) { {"kaltura_audio_playlist_ssi" => "foo_bar"} }
    let(:playlist_with_audio) { {"kaltura_audio_playlist_ssi" => "foo_bar", "kaltura_audio_ssi" => "foo;bar;baz"} }
    let(:player) { MDL::BorealisAudio.new.viewer }
    let(:audios) do
      [
        MDL::BorealisAudio.new(collection: 'audios',
                               id: 33,
                               document: audio_document,
                               transcript: 'Audio One blah')
      ]
    end
    let(:audio_playlists) do
      [
        MDL::BorealisAudio.new(collection: 'audios',
                               id: 33,
                               document: audio_playlist_document,
                               transcript: 'Audio One blah')
      ]
    end

    it 'provides downloads' do
      expect(BorealisAudio.new.downloads).to eq []
    end

    it 'knows its viewer' do
      expect(BorealisAudio.new.viewer).to be MDL::BorealisAudioPlayer
    end

    it 'knows its type' do
      expect(BorealisAudio.new.type).to eq 'kaltura_audio'
    end

    it 'knows its audio playlist id' do
      expect(BorealisAudio.new(document: { 'kaltura_audio_playlist_ssi' =>
                                           'foobar:123' })
        .audio_playlist_id).to eq 'foobar:123'
    end

    it 'knows its audio id' do
      expect(BorealisAudio.new(document: { 'kaltura_audio_ssi' =>
                                           'foobar:123' })
        .audio_id).to eq 'foobar:123'
    end
  end
end

