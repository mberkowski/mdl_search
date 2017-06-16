module MDL
  class BorealisOpenSeadragon < BorealisAssetsViewer
    attr_accessor :focus

    def type
      'image'
    end

    def to_viewer
      {
        'type' => type,
        'basename' => '',
        'thumbnail' => assets.first.thumbnail,
        'label' => 'Image',
        'include_controls' => true,
        'sequenceMode' => true,
        'showReferenceStrip' => true,
        'defaultZoomLevel' => 0,
        'minZoomLevel' => 0,
        'tileSources' => assets.map { |img| img.src },
        'transcript' => {
          'texts' => assets.map do |img|
            img.transcripts if img.transcripts != ''
          end.flatten.compact.uniq,
          'label' => 'Image'
        },
        'tocs' => assets.map { |img| img.title }
      }
    end
  end
end