require 'rsolr'

class SolrClient
 def more_like_this(query)
    client.get 'select', :params => {q: query, start: 0, rows:  9, fl: 'title_ssi, id', mm: '0%'}.merge(mlt_config)
  end

  def mlt_config
    {
      mlt: true,
      'mlt.fl' => 'title_tei, creator_teim, subject_teim, formal_subject_teim, topic_teim, id',
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