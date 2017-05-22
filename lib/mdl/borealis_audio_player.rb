module MDL
  class BorealisAudioPlayer < BorealisAssetsViewer

    def to_viewer
      (asset.audio_playlist_id) ? playlist : player
    end

    def player
      {
        'type' => asset.type,
        'targetId' => 'kaltura_player',
        'wid' => '_1369852',
        'uiconf_id' => 38708801,
        'entry_id' => asset.audio_id,
        'transcript' => {
          'texts' => asset.transcripts,
          'label' => 'Audio',
        },
        'height' => '125px',
        'width' => '560px',
        'thumbnail' => "https://d1kue88aredzk1.cloudfront.net/audio-3.png"
      }
    end

    def playlist
      {
        'type' => 'kaltura_audio_playlist',
        'targetId' => 'kaltura_player_playlist',
        'wid' => '_1369852',
        'uiconf_id' => 38719361,
        'flashvars' => {
          'streamerType' => 'auto',
          'playlistAPI.kpl0Id' => asset.audio_playlist_id,
        },
        'transcript' => {
          'texts' => asset.transcripts,
          'label' => 'Audio Playlist',
        },
        'height' => '395px',
        'width' => '560px',
        'thumbnail' => "https://d1kue88aredzk1.cloudfront.net/audio-3.png"
      }
    end
  end
end