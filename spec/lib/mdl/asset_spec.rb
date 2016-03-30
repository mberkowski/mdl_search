require 'rails_helper'
require_relative '../../../lib/mdl/asset.rb'

describe MDL::Asset do
  let(:document) { (create :cdm_document).to_h }
  subject { MDL::Asset.new(document)}

  it 'maps item formats to a kind of viewer (for use withing views templates)' do
   expect(subject.viewer).to eq 'image'
  end

  it 'returns an id' do
   expect(subject.id).to eq '13128'
  end

  it 'returns a collection' do
   expect(subject.collection).to eq 'mpls'
  end

  it 'returns a filename' do
   expect(subject.filename).to eq 'mpls-13128'
  end

  it 'returns a title' do
   asset = MDL::Asset.new(document.merge(title: 'Aerial Lift Bridge'))
   expect(asset.title).to eq 'Aerial Lift Bridge'
  end
end
