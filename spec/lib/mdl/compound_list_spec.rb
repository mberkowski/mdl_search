require 'rails_helper'
require_relative '../../../lib/mdl/compound_list.rb'

describe MDL::CompoundList do
  let(:records) { [(create :record, :with_compound_info).to_h] }
  subject { MDL::CompoundList.new(records)}

  it 'returns a list of compounds' do
    expect(subject.compounds.first).to be_kind_of(MDL::CompoundItem)
  end
end
