require 'rails_helper'
require_relative '../../../lib/mdl/asset.rb'

describe MDL::Asset do
  let(:document) { (create :cdm_document).to_h }
  subject { MDL::Asset.new(document)}

  it 'maps item formats to a kind of viewer (for use withing views templates)' do
   expect(subject.viewer).to eq 'image'
  end

  it 'returns a thumbnail url' do
   expect(subject.thumbnail).to eq 'http://reflections.mndigital.org/utils/getthumbnail/collection/mpls/id/13128'
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

  it 'returns thumbnail data' do
    VCR.use_cassette("thumbnail_data") do
      response = Net::HTTP.get_response(URI('http://reflections.mndigital.org/utils/getthumbnail/collection/mpls/id/13128')).body
      expect(subject.thumbnail_data).to eq response
    end
  end
end
