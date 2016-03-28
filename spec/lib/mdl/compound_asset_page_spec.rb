require 'rails_helper'
require_relative '../../../lib/mdl/compound_asset_page.rb'

describe MDL::CompoundAssetPage do
  let(:document) { (create :cdm_document, :with_compound_objects).to_h }
  subject { MDL::CompoundAsset.new(document).pages.first}

  it 'returns a page title' do
    expect(subject.title).to eq 'Front Cover'
  end

  it 'knows about its own format' do
    expect(subject.format).to eq 'jp2'
  end

  it 'returns a file name' do
    expect(subject.filename).to eq '13096.jp2'
  end

  it 'knows about its id' do
    expect(subject.id).to eq '13096'
  end

  it 'produces an HTML link to a viewer for this page' do
    expect(subject.menu_link).to eq '<a id="image-mpls-13096-13096.jp2" href="/catalog/mpls:13128?compound=13096#compound-13096"><div>Front Cover</div> <img src="http://reflections.mndigital.org/utils/getthumbnail/collection/mpls/id/13096" alt="13096" /></a>'
  end
end
