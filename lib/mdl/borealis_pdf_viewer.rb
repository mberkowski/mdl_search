module MDL
  class BorealisPDFViewer < BorealisAssetsViewer
    def type
      'pdf'
    end

    # Emtpy transcript section below is for backwards compatibility
    # Need to refactor react-borealis to make this not required
    def to_viewer
      {
        'transcript' => {
            'texts' => [],
            'label' => 'PDF'
        },
        'type' => type,
        'config' => {
          'height' => 800,
          'width' => '100%',
        },
       'thumbnail' => assets.first.thumbnail,
       'values' => values
      }
    end

    def values
      assets.map do |pdf|
        {
          'src' => pdf.src,
          'thumbnail' => pdf.thumbnail,
          'transcript' => {
            'texts' => pdf.transcripts,
            'label' => 'PDF'
          }
        }
      end
    end
  end
end