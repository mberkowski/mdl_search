require 'rails_helper'
require_relative '../../../lib/mdl/compound_item.rb'

describe MDL::CompoundItem do
  let(:record) { (create :record, :with_compound_info).to_h }
  subject { MDL::CompoundItem.new(record)}

  it 'knows about its format' do
    expect(subject.viewer).to eq 'pdf'
  end

  it 'knows about its item id' do
    expect(subject.item_id).to eq '999'
  end
end
