require 'rails_helper'

describe DeleteRecord, type: :service do
  let(:solr_client) { double("DeleteRecord") }
  let(:solr_client_object) { double }
  it "...deletes a record" do
    expect(solr_client).to receive(:delete_by_query).with 'id:foobar'
    DeleteRecord.new(id: 'foobar', solr_client: solr_client).delete!
  end
end
