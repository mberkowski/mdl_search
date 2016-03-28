require 'rails_helper'
require_relative '../../../lib/mdl/thumbnail.rb'

describe MDL::Thumbnail do
  let(:tmpdir) { File.join(Rails.root, 'tmp') }
  let(:tmpfilepath) { File.join(tmpdir, 'mpls_13128.jpg') }
  before(:each) do
    FileUtils.rm(tmpfilepath) if File.exist?(tmpfilepath)
  end

  let(:asset) { MDL::Asset.new((create :cdm_document).to_h) }
  subject { MDL::Thumbnail.new(collection: asset.collection, id: asset.id, cache_dir: tmpdir) }

  it 'returns a its url' do
   expect(subject.url).to eq 'http://reflections.mndigital.org/utils/getthumbnail/collection/mpls/id/13128'
  end

  it 'returns its data' do
    VCR.use_cassette("thumbnail_data") do
      response = Net::HTTP.get_response(URI('http://reflections.mndigital.org/utils/getthumbnail/collection/mpls/id/13128')).body
      expect(subject.data).to eq response
    end
  end

  it 'correctly reports that it has not been cached when it has not been cached' do
    expect(subject.cached?).to eq false
  end

  it 'saves a thumbnail locally and lets us know if it has been saved' do
    VCR.use_cassette("save_thumbnail_data") do
      subject.save
      expect(File.exist?(tmpfilepath)).to eq true
      expect(subject.cached?).to eq true
      expect(subject.cached_file).to eq File.read(tmpfilepath)
    end
  end


end
