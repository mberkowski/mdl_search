module MDL
  class BorealisVideoPlayer < BorealisAssetsViewer
    def to_viewer
      {
        'type' => asset.type,
        'targetId' => 'kaltura_player_video',
        'wid' => '_1369852',
        'uiconf_id' => 38683631,
        'transcript' => {
          'texts' => asset.transcripts,
          'label' => 'Video',
        },
        'entry_id' => asset.document['kaltura_video_ssi'],
        'height' => '315px',
        'width' => '560px',
        'thumbnail' => "https://d1kue88aredzk1.cloudfront.net/video-1.png"
      }
    end
  end
end