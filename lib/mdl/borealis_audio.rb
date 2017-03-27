module MDL
  class BorealisAudio <  BorealisAsset

    def downloads
        []
    end

    def to_viewer
      (document['kaltura_audio_playlist_ssi'] != '') ? playlist : player
    end

    def player
      {
        'type' => 'kaltura_audio',
        'targetId' => 'kaltura_player',
        'wid' => '_1369852',
        'uiconf_id' => 38708801,
        'entry_id' => document['kaltura_audio_ssi'],
        'transcript' => {
          'texts' => transcripts,
          'label' => 'Audio',
        },
        'height' => '70px',
        'width' => '460px',
        'thumbnail' => "https://cdm16022.contentdm.oclc.org/utils/getthumbnail/collection/#{collection}/id/#{id}"
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
          'playlistAPI.kpl0Id' => document['kaltura_audio_playlist_ssi'],
        },
        'transcript' => {
          'texts' => transcripts,
          'label' => 'Audio Playlist',
        },
        'height' => '395px',
        'width' => '560px',
        'thumbnail' => "https://cdm16022.contentdm.oclc.org/utils/getthumbnail/collection/#{collection}/id/#{id}"
      }
    end
  end
end