require_relative '../../../lib/mdl/borealis_assets_viewer.rb'
require_relative '../../../lib/mdl/borealis_asset.rb'
require_relative '../../../lib/mdl/borealis_video.rb'
require_relative '../../../lib/mdl/borealis_video_player.rb'
module MDL
  describe BorealisVideo do
    let(:video) do
      BorealisVideo.new(document: { 'kaltura_video_ssi' => '1234' },
                        collection: 'foo', id: '124')
    end
    it 'provides a download link' do
      expect(video.downloads).to eq []
    end

    it 'knows its src' do
      expect(video.src).to eq 'http://cdm16022.contentdm.oclc.org/utils/getstream/collection/foo/id/124'
    end

    it 'knows its player' do
      expect(video.viewer).to be MDL::BorealisVideoPlayer
    end

    it 'knows its type' do
      expect(video.type).to eq 'kaltura_video'
    end

    it 'knows its video_id' do
      expect(video.video_id).to eq '1234'
    end
  end
end
