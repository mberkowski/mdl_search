require_relative '../../../lib/mdl/borealis_assets_viewer.rb'
require_relative '../../../lib/mdl/borealis_asset.rb'
require_relative '../../../lib/mdl/borealis_ppt.rb'
require_relative '../../../lib/mdl/borealis_ppt_viewer.rb'
module MDL
  describe BorealisPPT do
    it 'provides downloads' do
      expect(BorealisPPT.new.downloads).to eq []
    end

    it 'knows its viewer' do
      expect(BorealisPPT.new.viewer).to be MDL::BorealisPPTViewer
    end

    it 'knows its type' do
      expect(BorealisPPT.new.type).to eq 'ppt'
    end

    it 'knows its type' do
      expect(BorealisPPT.new.type).to eq 'ppt'
    end

    it 'knows its src' do
      expect(BorealisPPT.new(collection: 'foo',
                             id: '123').src).to eq 'http://cdm16022.contentdm.oclc.org/utils/getfile/collection/foo/id/123/filename'
    end
  end
end
