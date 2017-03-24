module MDL
  class BorealisVideo <  BorealisAsset

    def src
      "http://reflections.mndigital.org/utils/getstream/collection/#{collection}/id/#{id}"
    end

    def downloads
        []
    end

    def to_viewer
      {
        'type' => 'kaltura_video',
        'targetId' => 'kaltura_player_1489614720',
        'wid' => '_1369852',
        'uiconf_id' => 38683631,
        'transcript' => {
          'texts' => transcripts,
          'label' => 'Video',
        },
        'entry_id' => document['kaltura_video_ssi'],
        'height' => '315px',
        'width' => '560px',
        'thumbnail' => "https://cdm16022.contentdm.oclc.org/utils/getthumbnail/collection/#{collection}/id/#{id}"
      }
    end

  end
end