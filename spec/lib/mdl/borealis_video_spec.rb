require_relative '../../../lib/mdl/borealis_asset.rb'
require_relative '../../../lib/mdl/borealis_video.rb'
module MDL
  describe BorealisVideo do
    let(:video) { MDL::BorealisVideo.new(collection: 'foo', id: 21, transcript: 'Video transcript here') }
    it 'correctly identifies its src' do
      expect(video.src).to eq 'http://reflections.mndigital.org/utils/getstream/collection/foo/id/21'
    end

    it 'correctly identifies its downloads' do
      expect(video.downloads).to eq []
    end

    it 'serializes itself for use in the viewer' do
      expect(video.to_viewer).to eq (
        {
          "type"=>"video",
          "thumbnail"=>"/thumbnails/foo:21",
          "height"=>500,
          "width"=>500,
          "src"=>"http://reflections.mndigital.org/utils/getstream/collection/foo/id/21",
          "transcript"=>{
            "label"=>"Video",
            "texts"=>["Video transcript here"]
          }
        })
    end
  end
end

