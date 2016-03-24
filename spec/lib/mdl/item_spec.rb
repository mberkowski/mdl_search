require 'rails_helper'
require_relative '../../../lib/mdl/item.rb'

describe MDL::Item do
  let(:record) { (create :record).to_h }
  subject { MDL::Item.new(record)}

  it 'responds to fields provided by a record hash' do 
   expect(subject.original_file_uri).to eq 'http://reflections.mndigital.org/utils/getfile/collection/swede1900/id/134/filename/swede1900-134'
   expect(subject.collection).to eq 'swede1900'
   expect(subject.id).to eq '134'
  end

  it 'indicates how it can be viewed' do
    expect(subject.viewer).to eq 'image'
  end

  it 'produces a thumbnail' do
    expect(subject.thumbnail).to eq 'http://reflections.mndigital.org/utils/getthumbnail/collection/swede1900/id/134'
  end
end
