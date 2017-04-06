module MDL
  class BorealisAudio <  BorealisAsset

    def downloads
        []
    end

    def to_viewer
      (audio_playlist_id) ? playlist : player
    end

    private

    def player
      {
        'type' => 'kaltura_audio',
        'targetId' => 'kaltura_player',
        'wid' => '_1369852',
        'uiconf_id' => 38708801,
        'entry_id' => audio_id,
        'transcript' => {
          'texts' => transcripts,
          'label' => 'Audio',
        },
        'height' => '125px',
        'width' => '460px',
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
          'playlistAPI.kpl0Id' => audio_playlist_id,
        },
        'transcript' => {
          'texts' => transcripts,
          'label' => 'Audio Playlist',
        },
        'height' => '395px',
        'width' => '560px',
        'thumbnail' => "https://d1kue88aredzk1.cloudfront.net/audio-3.png"
      }
    end

    def audio_playlist_id
      document.fetch('kaltura_audio_playlist_ssi', false)
    end

    def audio_id
      document.fetch('kaltura_audio_ssi', false)
    end
  end
end