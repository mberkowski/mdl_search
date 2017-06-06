require_relative '../../../lib/mdl/borealis_assets_viewer.rb'
require_relative '../../../lib/mdl/borealis_asset.rb'
require_relative '../../../lib/mdl/borealis_image.rb'
require_relative '../../../lib/mdl/borealis_video.rb'
require_relative '../../../lib/mdl/borealis_pdf.rb'
require_relative '../../../lib/mdl/borealis_pdf_viewer.rb'
require_relative '../../../lib/mdl/borealis_video_player.rb'
require_relative '../../../lib/mdl/borealis_open_seadragon.rb'
require_relative '../../../lib/mdl/borealis_asset_to_viewer.rb'
require_relative '../../../lib/mdl/borealis_assets_to_viewers.rb'

module MDL
  describe BorealisAssetsToViewers do
    let(:pdfs) do
      [
        MDL::BorealisPDF.new(collection: 'pdfs',
                             id: 33,
                             transcript: 'PDF One',
                             document: { 'id' => 'foo:12' }),
        MDL::BorealisPDF.new(collection: 'pdfs',
                             id: 334,
                             transcript: 'PDF Two',
                             document: { 'id' => 'foo:13' })
      ]
    end



    let(:videos) do
      [
        MDL::BorealisVideo.new(collection: 'videos',
                               id: 5,
                               transcript: 'Video One')
      ]
    end

    let(:images) do
      [
        MDL::BorealisImage.new(collection: 'images',
                               id: 1,
                               title: 'blah',
                               transcript: 'Image One'),
        MDL::BorealisImage.new(collection: 'images',
                               id: 2,
                               title: 'blah',
                               transcript: 'Image Two')
      ]
    end

    it 'produces a configuration for Images (OpenSeadragon)' do
      expect(to_viewers(images)).to eq(
        'image' => {
          'type' => 'image',
          'thumbnail' => '/thumbnails/images:1',
          'label' => 'Image',
          'include_controls' => true,
          'sequenceMode' => true,
          'showReferenceStrip' => true,
          'defaultZoomLevel' => 0,
          'minZoomLevel' => 0,
          'tileSources' => [
            '/contentdm-images/info?id=images:1',
            '/contentdm-images/info?id=images:2'
          ],
          'transcript' => {
            'texts' => ['Image One', 'Image Two'],
            'label' => 'Image'
          },
          'tocs' => %w[blah blah]
        }
      )
    end

    it 'produces a configuration for PDFs' do
      expect(to_viewers(pdfs)).to eq(
        'pdf' => {
          'transcript' => {
            'texts' => [],
            'label' => 'PDF'
          },
          'type' => 'pdf',
          'config' => {
            'height' => 800,
            'width' => '100%'
          },
          'thumbnail' => 'https://d1kue88aredzk1.cloudfront.net/reflections-pdf-icon.png',
          'values' => [
            {
              'src' => 'http://cdm16022.contentdm.oclc.org/utils/getfile/collection/pdfs/id/33/filename',
              'thumbnail' => '/thumbnails/pdfs:33',
              'transcript' => {
                'texts' => [
                  'PDF One'
                ],
                'label' => 'PDF'
              }
            },
            {
              'src' => 'http://cdm16022.contentdm.oclc.org/utils/getfile/collection/pdfs/id/334/filename',
              'thumbnail' => '/thumbnails/pdfs:334',
              'transcript' => {
                'texts' => ['PDF Two'], 'label' => 'PDF'
              }
            }
          ]
        }
      )
    end

    it 'produces a configuration for Videos' do
      expect(to_viewers(videos)).to eq(
        'kaltura_video' => {
          'type' => 'kaltura_video',
          'targetId' => 'kaltura_player_video',
          'wid' => '_1369852',
          'uiconf_id' => 38683631,
          'transcript' => {
            'texts' => ['Video One'],
            'label' => 'Video'
          },
          'entry_id' => nil,
          'height' => '315px',
          'width' => '560px',
          'thumbnail' => 'https://d1kue88aredzk1.cloudfront.net/video-1.png'
          }
      )
    end

    def to_viewers(assets)
      MDL::BorealisAssetsToViewers.new(assets: assets).viewers
    end
  end
end
