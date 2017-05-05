# A wrapper around a solr bounding box query
class Nearby
  def self.search(q: '*:*', pt: '46.7296,-94.6859', d: 35)
    Blacklight.default_index.connection.get('select',
      :params => { :q => "#{q} -coordinates_llsi:\"#{pt}\"",
        :d => d,
        :pt => pt,
        :fl => '*',
        :fq => '{!bbox sfield=coordinates_llsi}',
        :defType => 'edismax',
        :rows => 250
      })['response']['docs'].map do |nearby|
        nearby.merge(initial_path: initial_path(nearby))
      end
    rescue StandardError => e
      Rails.logger.error("Nearby Error: #{e}")
      []
  end

  def self.initial_path(dock)
    MDL::BorealisDocument.new(document: doc).initial_path
  end
end

