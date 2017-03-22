module MdlBlacklightHelper
  include Blacklight::LayoutHelperBehavior

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
