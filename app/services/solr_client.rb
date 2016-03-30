class SolrClient
 def more_like_this(query)
    response = client.get 'select', :params => {q: query, start: 0, rows:  9, fl: 'title_ssi, id'}.merge(mlt_config)
    raise response.inspect
  end

  def mlt_config
    {
      mlt: true,
      'mlt.fl' => 'title_tei, creator_teim, subject_teim, id',
      'mlt.count' => 20,
      'mlt.mintf' => 1
    }
  end

  def client
    connect
  end

  def connect
    Blacklight.default_index.connection
  end
end