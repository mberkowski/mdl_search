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
        'wrapper_height' => '125px',
        'wrapper_width' => '60%',
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
        'wrapper_height' => '395px',
        'wrapper_width' => '60%',
        'thumbnail' => "https://d1kue88aredzk1.cloudfront.net/audio-3.png"
      }
    end
  end
end