require_relative '../../../lib/mdl/borealis_config.rb'

module MDL
  describe BorealisConfig do

    let(:expected_config) do
      [
        {
          :focus=>nil,
          :type=>"audio",
          :src=>"http://example.com/1",
          :tray_thumbnail=>"/thumbnails/foo/1"
        },
        {
          :focus=>nil,
          :type=>"video",
          :src=>"http://example.com/1",
          :tray_thumbnail=>"/thumbnails/foo/1"
        },
        {
          :focus=>nil,
          :type=>"pdf",
          :src=>"http://example.com/1",
          :tray_thumbnail=>"/thumbnails/foo/1"
        },
        {
          :focus=>true,
          :type=>"image",
          :src=>"http://example.com/1",
          :tray_thumbnail=>"/thumbnails/foo/1",
          "os_config"=>{
            "sequenceMode"=>true,
            "showReferenceStrip"=>true,
            "defaultZoomLevel"=>0,
            "minZoomLevel"=>0,
            "tileSources"=>["http://example.com/1", "http://example.com/1"]
         },
          :include_controls=>true
        }
      ]
  end

    class FakeAsset
      attr_accessor :type
      attr_accessor :focus
      def initialize(type)
        @type = type
      end

      def id
        1
      end

      def collection
        'foo'
      end

      def src
        'http://example.com/1'
      end

      def thumbnail
        '/thumbnails/foo/1'
      end
    end


    let(:assets) {[FakeAsset.new('image'),
                   FakeAsset.new('image'),
                   FakeAsset.new('audio'),
                   FakeAsset.new('video'),
                   FakeAsset.new('pdf')]}

    it 'sets focus of the first asset' do
      config = BorealisConfig.new(assets: assets).config
      expect(config).to eq(expected_config)
    end
  end
end