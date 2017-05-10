require_relative '../../../lib/mdl/borealis_asset.rb'
require_relative '../../../lib/mdl/borealis_image.rb'
module MDL
  describe BorealisImage do
    let(:video) { MDL::BorealisImage.new(collection: 'foo', id: 21, transcript: 'Audio transcript here', title: 'Blarg') }
    it 'correctly identifies its src' do
      expect(video.src).to eq '/contentdm-images/info?id=foo:21'
    end

    it 'correctly identifies its type' do
      expect(video.type).to eq 'image'
    end

    it 'correctly identifies its downloads' do
      expect(video.downloads).to eq [
        { src: "http://cdm16022.contentdm.oclc.org/digital/iiif/foo/21/full/150,150/0/default.jpg", label: '(150 x 150)' },
        { src: "http://cdm16022.contentdm.oclc.org/digital/iiif/foo/21/full/800,800/0/default.jpg", label: '(800 x 800)' },
        { src: "http://cdm16022.contentdm.oclc.org/digital/iiif/foo/21/full/1920,1920/0/default.jpg", label: '(1920 x 1920)' }
      ]
    end

    it 'serializes itself for use in the viewer' do
      expect(video.to_viewer).to eq ({})
    end

    it 'allows a title to be set' do
      expect(video.title).to eq 'Blarg'
    end
  end
end

