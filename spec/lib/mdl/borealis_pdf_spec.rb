require_relative '../../../lib/mdl/borealis_asset.rb'
require_relative '../../../lib/mdl/borealis_pdf.rb'
module MDL
  describe BorealisPDF do
    let(:video) { MDL::BorealisPDF.new(collection: 'foo', id: 21, transcript: 'Audio transcript here') }
    it 'correctly identifies its src' do
      expect(video.src).to eq 'http://reflections.mndigital.org/utils/getfile/collection/foo/id/21/filename/21.pdf'
    end

    it 'correctly identifies its downloads' do
      expect(video.downloads).to eq [{:src=>"http://reflections.mndigital.org/utils/getfile/collection/foo/id/21/filename/21.pdf", :label=>"Download"}]
    end

    it 'serializes itself for use in the viewer' do
      expect(video.to_viewer).to eq ({"focus" => false,
                                      "height" => 800,
                                      "items" => [{"type"=>"pdf", "label"=>"PDF", "focus"=>true, "src"=>"http://reflections.mndigital.org/utils/getfile/collection/foo/id/21/filename/21.pdf"}, {"type"=>"transcript", "label"=>"Transcript", "texts"=>["Audio transcript here"], "focus"=>false}],
                                      "thumbnail" => "/thumbnails/foo:21",
                                      "type" => "pdf"
                                    })
    end
  end
end

        