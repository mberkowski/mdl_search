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

  def record_count
    number_with_delimiter(Blacklight.default_index.connection.get('select',
      :params => { :q => '*:*',
        :defType => 'edismax',
        :fl => '',
        :rows => 1
      })['response']['numFound'])
  end

 ##
  # Classes used for sizing the sidebar content of a Blacklight page
  # @return [String]
  def sidebar_classes
    'col-md-12 col-sm-12 col-lg-3'
  end
end
