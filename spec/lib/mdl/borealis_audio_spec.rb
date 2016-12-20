require_relative '../../../lib/mdl/borealis_asset.rb'
require_relative '../../../lib/mdl/borealis_audio.rb'
module MDL
  describe BorealisAudio do
    let(:video) { MDL::BorealisAudio.new(collection: 'foo', id: 21, transcript: 'Audio transcript here') }
    it 'correctly identifies its src' do
      expect(video.src).to eq 'http://reflections.mndigital.org/utils/getstream/collection/foo/id/21'
    end

    it 'correctly identifies its downloads' do
      expect(video.downloads).to eq []
    end

    it 'serializes itself for use in the viewer' do
      expect(video.to_viewer).to eq ({"focus" => false,
                                      "items" => [{"type"=>"audio", "label"=>"Audio", "focus"=>true, "src"=>"http://reflections.mndigital.org/utils/getstream/collection/foo/id/21"}, {"type"=>"transcript", "label"=>"Transcript", "texts"=>["Audio transcript here"], "focus"=>false}],
                                      "thumbnail" => "/thumbnails/foo:21",
                                      "type" => "audio"
                                    })
    end
  end
end

        