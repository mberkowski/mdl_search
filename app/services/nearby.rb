# A wrapper around a solr bounding box query
class Nearby
  def self.search(q: '*:*', pt: '46.7296,-94.6859', d: 35)
    Blacklight.default_index.connection.get('select',
      :params => { :q => "#{q} -coordinates_llsi:\"#{pt}\"",
        :d => d,
        :pt => pt,
        :fl => 'coordinates_llsi, title_ssi, id',
        :fq => '{!bbox sfield=coordinates_llsi}',
        :defType => 'edismax',
        :rows => 100
      })['response']['docs']
    rescue StandardError => e
      Rails.logger.error("Nearby Error: #{e}")
      []
  end
end

