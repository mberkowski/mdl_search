# frozen_string_literal: true
class CatalogController < ApplicationController

  include Blacklight::Catalog


  # Override blacklights limit param for facets.
  # See: def solr_facet_params - blacklight-5.7.2/lib/blacklight/solr_helper.rb
  def facet_list_limit
    (params[:limit]) ? params[:limit] : 20
  end

  configure_blacklight do |config|
    ## Class for sending and receiving requests from a search index
    # config.repository_class = Blacklight::Solr::Repository
    #
    ## Class for converting Blacklight's url parameters to into request parameters for the search index
    # config.search_builder_class = ::SearchBuilder
    #
    ## Model that maps search index responses to the blacklight response model
    # config.response_model = Blacklight::Solr::Response

    ## Default parameters to send to solr for all search-like requests. See also SearchBuilder#processed_parameters
    config.default_solr_params = {
      rows: 20,
      fl: '*'
    }

    config.default_per_page = 20

    config.autocomplete_enabled = true
    config.autocomplete_path = 'suggest'

    config.index.thumbnail_method = :cached_thumbnail_tag
    config.show.thumbnail_method = :cached_thumbnail_tag

    config.view.gallery.default = false
    config.view.gallery.partials = [:index]
    config.view.gallery.icon_class = "glyphicon-th"

    # solr path which will be added to solr base url before the other solr params.
    #config.solr_path = 'select'

    # items to show per page, each number in the array represent another option to choose from.
    #config.per_page = [10,20,50,100]

    ## Default parameters to send on single-document requests to Solr. These settings are the Blackligt defaults (see SearchHelper#solr_doc_params) or
    ## parameters included in the Blacklight-jetty document requestHandler.
    #
    #config.default_document_solr_params = {
    #  qt: 'document',
    #  ## These are hard-coded in the blacklight 'document' requestHandler
    #  # fl: '*',
    #  # rows: 1
    #  # q: '{!term f=id v=$id}'
    #}

    # solr field configuration for search results/index views
    config.index.title_field = 'title_ssi'
    config.index.display_type_field = 'type_ssi'

    # solr field configuration for document/show views
    #config.show.title_field = 'title_display'
    #config.show.display_type_field = 'format'

    # solr fields that will be treated as facets by the blacklight application
    #   The ordering of the field names is the order of the display
    #
    # Setting a limit will trigger Blacklight's 'more' facet values link.
    # * If left unset, then all facet values returned by solr will be displayed.
    # * If set to an integer, then "f.somefield.facet.limit" will be added to
    # solr request, with actual solr request being +1 your configured limit --
    # you configure the number of items you actually want _displayed_ in a page.
    # * If set to 'true', then no additional parameters will be sent to solr,
    # but any 'sniffed' request limit parameters will be used for paging, with
    # paging at requested limit -1. Can sniff from facet.limit or
    # f.specific_field.facet.limit solr request params. This 'true' config
    # can be used if you set limits in :default_solr_params, or as defaults
    # on the solr side in the request handler itself. Request handler defaults
    # sniffing requires solr requests to be made with "echoParams=all", for
    # app code to actually have it echo'd back to see it.
    #
    # :show may be set to false if you don't want the facet to be drawn in the
    # facet bar
    #
    # set :index_range to true if you want the facet pagination view to have facet prefix-based navigation
    #  (useful when user clicks "more" on a large facet and wants to navigate alphabetically across a large set of results)
    # :index_range can be an array or range of prefixes that will be used to create the navigation (note: It is case sensitive when searching values)

    config.add_facet_field 'contributing_organization_ssi', label: 'Contributing Institution', index_range: 'A'..'Z', collapse: false, limit: 5, index: true
    # config.add_facet_field 'subject_topic_facet', label: 'Topic', limit: 20, index_range: 'A'..'Z'
    config.add_facet_field 'creator_ssim', label: 'Creator', show: true, collapse: false, limit: 5, index_range: 'A'..'Z', collapse: false, limit: 5, index: true
    config.add_facet_field 'county_ssim', label: 'County', show: true, collapse: false, limit: 5, index_range: 'A'..'Z', collapse: false, limit: 5, index: true
    config.add_facet_field 'physical_format_ssi', label: 'Format-Medium', show: true, index_range: 'A'..'Z', collapse: false, limit: 5, index: true
    config.add_facet_field 'keyword_ssim', label: 'Keyword', limit: 20, show: true, collapse: false, index_range: 'A'..'Z', collapse: false, limit: 5, index: true
    config.add_facet_field 'type_ssi', label: 'Type', show: true, collapse: false, limit: 5
    config.add_facet_field 'topic_ssim', label: 'Topic', show: true, index_range: 'A'..'Z', collapse: false, limit: 5, index: true
    config.add_facet_field 'record_type_ssi', label: 'Single or Compound', show: true
    config.add_facet_field 'dat_ssi', label: 'Date Created', limit: 5


    # Have BL send all facet field names to Solr, which has been the default
    # previously. Simply remove these lines if you'd rather use Solr request
    # handler defaults, or have no facets.
    config.add_facet_fields_to_solr_request!

    # solr fields to be displayed in the index (search results) view
    #   The ordering of the field names is the order of the display
    config.add_index_field 'creator_ssim', label: 'Creator'
    config.add_index_field 'dat_ssi', label: 'Date Created'
    config.add_index_field 'description_ts', label: 'Description'
    config.add_index_field 'contributing_organization_ssi', label: 'Contributing Institution'
    config.add_index_field 'type_ssi', label: 'Type'
    config.add_index_field 'physical_format_ssi', label: 'Format'

    # solr fields to be displayed in the show (single result) view
    #   The ordering of the field names is the order of the display
    config.add_show_field 'title_ssi', label: 'Title'
    config.add_show_field 'creator_ssim', label: 'Creator'
    config.add_show_field 'description_ts', label: 'Description'
    config.add_show_field 'dat_ssi', label: 'Date of Creation'
    config.add_show_field 'dimensions_ssi', label: 'Dimensions'
    config.add_show_field 'topic_ssim', label: 'Minnesota Reflections Topic'
    config.add_show_field 'type_ssi', label: 'Item Type'
    config.add_show_field 'physical_format_ssi', label: 'Item Physical Format'
    config.add_show_field 'formal_subject_ssim', label: 'Formal Subject Headings'
    config.add_show_field 'subject_ssim', label: 'Locally Assigned Subject Headings'
    config.add_show_field 'city_ssi', label: 'Minnesota City or Township'
    config.add_show_field 'county_ssim', label: 'Minnesota County'
    config.add_show_field 'state_ssi', label: 'State or Province'
    config.add_show_field 'country_ssi', label: 'Country'
    config.add_show_field 'collection_name_ssi', label: 'Collection Name'
    config.add_show_field 'contributing_organization_ssi', label: 'Contributing Organization'
    config.add_show_field 'contact_information_ssi', label: 'Contact Information'
    config.add_show_field 'rights_ssi', label: 'Rights Management'
    config.add_show_field 'local_identifier_ssi', label: 'Local Identifier'
    config.add_show_field 'identifier_ssi', label: 'MDL Identifier'
    config.add_show_field 'fiscal_sponsor_ssi', label: 'Fiscal Sponsor'

    # "fielded" search configuration. Used by pulldown among other places.
    # For supported keys in hash, see rdoc for Blacklight::SearchFields
    #
    # Search fields will inherit the :qt solr request handler from
    # config[:default_solr_parameters], OR can specify a different one
    # with a :qt key/value. Below examples inherit, except for subject
    # that specifies the same :qt as default for our own internal
    # testing purposes.
    #
    # The :key is what will be used to identify this BL search field internally,
    # as well as in URLs -- so changing it after deployment may break bookmarked
    # urls.  A display label will be automatically calculated from the :key,
    # or can be specified manually to be different.

    # This one uses all the defaults set by the solr request handler. Which
    # solr request handler? The one set in config[:default_solr_parameters][:qt],
    # since we aren't specifying it otherwise.

    config.add_search_field 'all_fields', label: 'All Fields'


    # Now we see how to over-ride Solr request handler defaults, in this
    # case for a BL "search field", which is really a dismax aggregate
    # of Solr search fields.

    config.add_search_field('title') do |field|
      # solr_parameters hash are sent to Solr as ordinary url query params.
      field.solr_parameters = { :'spellcheck.dictionary' => 'title' }

      # :solr_local_parameters will be sent using Solr LocalParams
      # syntax, as eg {! qf=$title_qf }. This is neccesary to use
      # Solr parameter de-referencing like $title_qf.
      # See: http://wiki.apache.org/solr/LocalParams
      field.solr_local_parameters = {
        qf: '$title_qf',
        pf: '$title_pf'
      }
    end

    config.add_search_field('creator') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'creator' }
      field.solr_local_parameters = {
        qf: '$creator_qf',
        pf: '$creator_pf'
      }
    end

    # Specifying a :qt only to show it's possible, and so our internal automated
    # tests can test it. In this case it's the same as
    # config[:default_solr_parameters][:qt], so isn't actually neccesary.
    config.add_search_field('subject') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'subject' }
      field.qt = 'search'
      field.solr_local_parameters = {
        qf: '$subject_qf',
        pf: '$subject_pf'
      }
    end

    # "sort results by" select (pulldown)
    # label in pulldown is followed by the name of the SOLR field to sort by and
    # whether the sort is ascending or descending (it must be asc or desc
    # except in the relevancy case).
    config.add_sort_field 'score desc, dat_sort desc, title_sort asc', label: 'relevance'
    config.add_sort_field 'dat_ssi desc, title_sort asc', label: 'year'
    config.add_sort_field 'creator_sort asc, title_sort asc', label: 'creator'
    config.add_sort_field 'title_sort asc, dat_sort desc', label: 'title'

    # If there are more than this many search results, no spelling ("did you
    # mean") suggestion is offered.
    config.spell_max = 5

    # Configuration for autocomplete suggestor
    config.autocomplete_enabled = true
    config.autocomplete_path = 'suggest'
  end
end
