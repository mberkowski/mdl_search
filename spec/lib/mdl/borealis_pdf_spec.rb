require_relative '../../../lib/mdl/borealis_asset.rb'
require_relative '../../../lib/mdl/borealis_pdf.rb'
module MDL
  describe BorealisPDF do
    let(:video) { MDL::BorealisPDF.new(collection: 'foo', id: 21, transcript: 'Audio transcript here') }
    it 'correctly identifies its src' do
      expect(video.src).to eq 'http://reflections.mndigital.org/utils/getfile/collection/foo/id/21/filename'
    end

    it 'correctly identifies its downloads' do
      expect(video.downloads).to eq [{:src=>"http://reflections.mndigital.org/utils/getfile/collection/foo/id/21/filename", :label=>"Download"}]
    end

    it 'serializes itself for use in the viewer' do
      expect(video.to_viewer).to eq ({"type"=>"pdf", "height"=>800, "thumbnail"=>"/thumbnails/foo:21", "src" => "http://reflections.mndigital.org/utils/getfile/collection/foo/id/21/filename", "transcript"=>{"label"=>"PDF", "texts"=>["Audio transcript here"]}})
    end
  end
end

