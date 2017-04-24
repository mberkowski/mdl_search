module MapsHelper

  def coordinates
    raw @document['coordinates_llsi'].split(',').to_json
  end

  def nearby_json
    raw nearby(q: '*:*', pt: @document['coordinates_llsi'], d: 25).to_json
  end

  def title
    @document['title_ssi']
  end

  def type
    @document['type_ssi']
  end

  def id
    @document['id']
  end

  def nearby(q: '*:*', pt: '46.7296, 94.6859', d: 10)
    Blacklight.default_index.connection.get('select',
      :params => { :q => "#{q} -coordinates_llsi:\"#{pt}\"",
        :d => d,
        :pt => pt,
        :fl => 'coordinates_llsi, title_ssi, id',
        :fq => '{!bbox sfield=coordinates_llsi}',
        :defType => 'edismax',
        :rows => 250
      })['response']['docs']
    rescue StandardError => e
      Rails.logger.error("Nearby Error: #{e}")
      []
  end

end