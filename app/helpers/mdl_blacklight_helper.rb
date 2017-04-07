module MdlBlacklightHelper
  include Blacklight::LayoutHelperBehavior

  def current_search
    request.original_url
  end

  def current_search_json
     current_search.gsub(/\/catalog/, '\catalog.json')
  end

  def json_result_link
    link_to(raw('<div class="icon-json pull-right"></div>'), current_search_json)
  end

  def json_page_link
    link_to(raw('<div class="icon-json pull-right"></div>'), "#{current_search}.json")
  end

  def record_count(q: '*:*')
    number_with_delimiter(Blacklight.default_index.connection.get('select',
      :params => { :q => q,
        :defType => 'edismax',
        :fl => '',
        :rows => 1
      })['response']['numFound'])
  end

  def nearby(q: '*:*', pt: '46.7296, 94.6859', d: 5)
    Blacklight.default_index.connection.get('select',
      :params => { :q => "#{q} -coordinates_llsi:\"#{pt}\"",
        :d => d,
        :pt => pt,
        :fl => 'coordinates_llsi, title_ssi, id',
        :fq => '{!bbox sfield=coordinates_llsi}',
        :defType => 'edismax',
        :rows => 1000
      })['response']['docs']
    rescue StandardError => e
      Rails.logger.error("Nearby Error: #{e}")
      []
  end

 ##
  # Classes used for sizing the sidebar content of a Blacklight page
  # @return [String]
  def sidebar_classes
    'col-md-12 col-sm-12 col-lg-3'
  end
end
