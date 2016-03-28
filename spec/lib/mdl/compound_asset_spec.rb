require 'rails_helper'
require_relative '../../../lib/mdl/compound_asset.rb'
require_relative '../../../lib/mdl/compound_asset_page.rb'

describe MDL::CompoundAsset do
  let(:document) { (create :cdm_document, :with_compound_objects).to_h }
  subject { MDL::CompoundAsset.new(document)}

  it 'responds with a list of compound asset pages' do
    expect(subject.pages.first).to be_kind_of(MDL::CompoundAssetPage)
  end

  context "when provided a page id" do
    it 'finds the first page in an array of compound asset pages' do
      page = subject.with_page_id('999')
      expect(page.document[:id]).to eq 'mpls:13128'
    end
  end

  context "when no page id is provided" do
    it 'finds the first page in an array of compound asset pages' do
      page = subject.with_page_id
      expect(page.document[:id]).to eq 'mpls:13128'
    end
  end
end
