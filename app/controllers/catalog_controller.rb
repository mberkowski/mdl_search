# frozen_string_literal: true
class CatalogController < ApplicationController

  include Blacklight::Catalog

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
      rows: 10,
      fl: '*'
    }


    config.index.thumbnail_method = :cached_thumbnail_tag
    config.show.thumbnail_method = :cached_thumbnail_tag
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

    config.add_facet_field 'contributing_organization_ssi', label: 'Collection', index_range: 'A'..'Z', sort: 'index', collapse: false, limit: 10,  :tag => 'co', :ex => 'co'
    # config.add_facet_field 'subject_topic_facet', label: 'Topic', limit: 20, index_range: 'A'..'Z'
    config.add_facet_field 'creator_ssim', label: 'Creator', show: true
    config.add_facet_field 'physical_format_ssi', label: 'Format', show: true
    config.add_facet_field 'formal_subject_ssim', label: 'Subject', limit: 20, show: true
    config.add_facet_field 'type_ssi', label: 'Type', show: true
    config.add_facet_field 'title_ssi', label: 'Title', show: true
    config.add_facet_field 'record_type_ssi', label: 'Single or Compound', show: true

    # Have BL send all facet field names to Solr, which has been the default
    # previously. Simply remove these lines if you'd rather use Solr request
    # handler defaults, or have no facets.
    config.add_facet_fields_to_solr_request!

    # solr fields to be displayed in the index (search results) view
    #   The ordering of the field names is the order of the display
    config.add_index_field 'dat_ssi', label: 'Date Created'
    config.add_index_field 'description_ssi', label: 'Description'
    config.add_index_field 'contributing_organization_ssi', label: 'Publisher'
    config.add_index_field 'type_ssi', label: 'Type'
    config.add_index_field 'physical_format_ssi', label: 'Format'

    # solr fields to be displayed in the show (single result) view
    #   The ordering of the field names is the order of the display
    # config.add_show_field 'title_ssi', label: 'Title'
    # config.add_show_field 'dat_ssi', label: 'Date Created'
    # config.add_show_field 'description_tei', label: 'Description'
    # config.add_show_field 'publishing_agency_tei', label: 'Publisher'


      # {dest_path: 'id', origin_path: 'id'},
      # {dest_path: 'title_tei', origin_path: 'title'},
      # {dest_path: 'title_ssi', origin_path: 'title'},
      # {dest_path: 'title_unstem_search', origin_path: 'title'},
      # {dest_path: 'contributor_teim', origin_path: 'contri'},
      # {dest_path: 'contributor_unstem_search', origin_path: 'contri'},
      # {dest_path: 'contributor_ssim', origin_path: 'contri'},
      # {dest_path: 'creator_teim', origin_path: 'photog'},
      # {dest_path: 'creator_unstem_search', origin_path: 'photog'},
      # {dest_path: 'creator_ssim', origin_path: 'photog'},
      # {dest_path: 'description_tei', origin_path: 'descri'},
      # {dest_path: 'dat_ssi', origin_path: 'dat'},
      # {dest_path: 'publishing_agency_tei', origin_path: 'publia'},
      # {dest_path: 'publishing_agency_unstem_search', origin_path: 'publia'},
      # {dest_path: 'publishing_agency_ssi', origin_path: 'publia'},
      # {dest_path: 'dimensions_ssi', origin_path: 'dimens'},
      # {dest_path: 'topic_teim', origin_path: 'genera'},
      # {dest_path: 'topic_unstem_search', origin_path: 'genera'},
      # {dest_path: 'topic_ssim', origin_path: 'genera'},
      # {dest_path: 'type_tei', origin_path: 'type'},
      # {dest_path: 'physical_format_tei', origin_path: 'physic'},
      # {dest_path: 'formal_subject_teim', origin_path: 'specif', formatters: [SplitFormatter, StripFormatter]},
      # {dest_path: 'formal_subject_unstem_search', origin_path: 'specif'},
      # {dest_path: 'formal_subject_ssim', origin_path: 'specif', formatters: [SplitFormatter, StripFormatter]},
      # {dest_path: 'subject_teim', origin_path: 'subjec', formatters: [SplitFormatter, StripFormatter]},
      # {dest_path: 'subject_unstem_search', origin_path: 'subjec'},
      # {dest_path: 'subject_ssim', origin_path: 'subjec', formatters: [SplitFormatter, StripFormatter]},
      # {dest_path: 'city_ssi', origin_path: 'city'},
      # {dest_path: 'district_ssi', origin_path: 'distri'},
      # {dest_path: 'county_ssi', origin_path: 'county'},
      # {dest_path: 'state_ssi', origin_path: 'state'},
      # {dest_path: 'country_ssi', origin_path: 'countr'},
      # {dest_path: 'language_ssi', origin_path: 'langua'},
      # {dest_path: 'contributing_organization_tei', origin_path: 'contra'},
      # {dest_path: 'contributing_unstem_search', origin_path: 'contra'},
      # {dest_path: 'contributing_organization_ssim', origin_path: 'contra'},
      # {dest_path: 'contact_information_ssi', origin_path: 'contac'},
      # {dest_path: 'rights_ssi', origin_path: 'righta'},
      # {dest_path: 'local_identifier_ssi', origin_path: 'identi'},
      # {dest_path: 'identifier_ssi', origin_path: 'resour'},
      # {dest_path: 'project_ssi', origin_path: 'projec'},
      # {dest_path: 'fiscal_sponsor_ssi', origin_path: 'fiscal'},
      # {dest_path: 'publisher_ssi', origin_path: 'publis'},
      # {dest_path: 'date_ssi', origin_path: 'date'},
      # {dest_path: 'format_ssi', origin_path: 'format'},
      # {dest_path: 'digspa_ssi', origin_path: 'digspa'},
      # {dest_path: 'digspb_ssi', origin_path: 'digspb'},
      # {dest_path: 'digspc_ssi', origin_path: 'digspc'},
      # {dest_path: 'digspd_ssi', origin_path: 'digspd'},
      # {dest_path: 'digspe_ssi', origin_path: 'digspe'},
      # {dest_path: 'digspf_ssi', origin_path: 'digspf'},
      # {dest_path: 'digspg_ssi', origin_path: 'digspg'},
      # {dest_path: 'digsph_ssi', origin_path: 'digsph'},
      # {dest_path: 'digspi_ssi', origin_path: 'digspi'},
      # {dest_path: 'digspj_ssi', origin_path: 'digspj'},
      # {dest_path: 'digspk_ssi', origin_path: 'digspk'},
      # {dest_path: 'transcription_tes', origin_path: 'transc'},
      # {dest_path: 'translation_tes', origin_path: 'transl'},
      # {dest_path: 'fullrs_tes', origin_path: 'fullrs'},
      # {dest_path: 'find_ssi', origin_path: 'find'},
      # {dest_path: 'dmaccess_ssi', origin_path: 'dmaccess'},
      # {dest_path: 'dmimage_ssi', origin_path: 'dmimage'},
      # {dest_path: 'dmcreated_ssi', origin_path: 'dmcreated'},
      # {dest_path: 'dmmodified_ssi', origin_path: 'dmmodified'},
      # {dest_path: 'dmoclcno_ssi', origin_path: 'dmoclcno'},
      # {dest_path: 'restriction_code_ssi', origin_path: 'restrictionCode'},
      # {dest_path: 'cdmfilesize_ssi', origin_path: 'cdmfilesize'},
      # {dest_path: 'cdmfilesizeformatted_ssi', origin_path: 'cdmfilesizeformatted'},
      # {dest_path: 'cdmprintpdf_is', origin_path: 'cdmprintpdf', formatters: [ToIFormatter]},
      # {dest_path: 'cdmhasocr_is', origin_path: 'cdmhasocr', formatters: [ToIFormatter]},
      # {dest_path: 'cdmisnewspaper_is', origin_path: 'cdmisnewspaper', formatters: [ToIFormatter]},
      # {dest_path: 'image_uri_ssi', origin_path: 'image_uri'},
      # {dest_path: 'record_type_ssi', origin_path: 'record_type'},
      # {dest_path: 'geographic_feature_ssi', origin_path: 'geogra'},
      # {dest_path: 'compound_objects_ts', origin_path: 'compound_objects', formatters: [ToJsonFormatter]}


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

    config.add_search_field('author') do |field|
      field.solr_parameters = { :'spellcheck.dictionary' => 'author' }
      field.solr_local_parameters = {
        qf: '$author_qf',
        pf: '$author_pf'
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
    config.add_sort_field 'score desc, pub_date_sort desc, title_sort asc', label: 'relevance'
    config.add_sort_field 'pub_date_sort desc, title_sort asc', label: 'year'
    config.add_sort_field 'author_sort asc, title_sort asc', label: 'author'
    config.add_sort_field 'title_sort asc, pub_date_sort desc', label: 'title'

    # If there are more than this many search results, no spelling ("did you
    # mean") suggestion is offered.
    config.spell_max = 5

    # Configuration for autocomplete suggestor
    config.autocomplete_enabled = true
    config.autocomplete_path = 'suggest'
  end
end
