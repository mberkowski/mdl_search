class DeleteRecord
  attr_reader :id, :solr_client
  def initialize(id: '', solr_client:  solr_client.new.client)
    @id = id
    @solr_client = solr_client
  end

  def delete!
    solr_client.delete_by_query "id:#{id}"
  end
end