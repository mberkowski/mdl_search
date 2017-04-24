module UrlHelper
  include Blacklight::UrlHelperBehavior

  # link_to_document(doc, 'VIEW', :counter => 3)
  # Use the catalog_path RESTful route to create a link to the show page for a specific item.
  # catalog_path accepts a hash. The solr query params are stored in the session,
  # so we only need the +counter+ param here. We also need to know if we are viewing to document as part of search results.
  # TODO: move this to the IndexPresenter
  def link_to_document(doc, field_or_opts = nil, opts={:counter => nil})
    if field_or_opts.is_a? Hash
      opts = field_or_opts
    else
      field = field_or_opts
    end

    field ||= document_show_link_field(doc)
    label = index_presenter(doc).label field, opts
    link_to label, "/catalog/#{doc['id']}#{borealis_path(doc)}?", document_link_params(doc, opts)
  end

  ##
  # Link to the next document in the current search context
  def link_to_next_document(next_document)
    link_opts = session_tracking_params(next_document, search_session['counter'].to_i + 1).merge(:class => "next", :rel => 'next')
    link_to_unless next_document.nil?, raw(t('views.pagination.next')), "/catalog/#{next_document['id']}#{borealis_path(next_document)}?", link_opts do
      content_tag :span, raw(t('views.pagination.next')), :class => 'next'
    end
  end

  def borealis_path(doc)
    borealis_asset(doc).new.initial_path
  end

  def borealis_asset(doc)
    MDL::BorealisAssetMap.new(format_field: doc['format_ssi']).map
  end
end