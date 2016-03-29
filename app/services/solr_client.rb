class SolrClient
  def more_like_this(query)
    client.get 'select', :params => {q: query, start: 0, rows:  20}.merge(mlt_config)
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