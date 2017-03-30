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
        'targetId' => 'kaltura_player_video',
        'wid' => '_1369852',
        'uiconf_id' => 38683631,
        'transcript' => {
          'texts' => transcripts,
          'label' => 'Video',
        },
        'entry_id' => document['kaltura_video_ssi'],
        'height' => '315px',
        'width' => '560px',
        'thumbnail' => "https://d1kue88aredzk1.cloudfront.net/video.jpg"
      }
    end

    private

    def video_id
      document['kaltura_video_ssi']
    end

  end
end