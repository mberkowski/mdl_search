module MDL
  class CiteDetails
    attr_reader :solr_doc
    def initialize(solr_doc: '{}')
      @solr_doc = solr_doc
    end

    def to_hash
      {
        focus: true,
        type: 'details',
        label: 'Details',
        fields: details
      }
    end

    def details
      details_fields.map do |field|
        val = solr_doc[field[:key]]
        vals = field_values([val].flatten, field[:key], field[:facet])
        map_details(vals, field[:label], field[:delimiter])
      end.compact
    end

    private

    def map_details(values, label, delimiter = nil, facet = nil)
      if values != [{}]
        [
          {label: label},
          {delimiter: delimiter},
          {field_values: values}
        ].inject({}) do |memo, item|
          (!empty_value?(item)) ? memo.merge(item) : memo
        end
      end
    end

    def empty_value?(item)
      item.values.flatten.compact.empty?
    end

    def field_values(values, key, facet)
      values.map do |val|
        [{text: val}, {url: facet_url(key, val, facet)}].inject({}) do |memo, item|
          (item.values.first) ? memo.merge(item) : memo
        end
      end
    end

    def facet_url(key, val, facet = false)
      (facet && val) ? URI.escape("/catalog?f[#{key}][]=#{val}") : nil
    end

    def details_fields
      [
        {key: 'title_ssi', label: 'Title'},
        {key: 'creator_ssim', label: 'Creator', delimiter: ', ', facet: true},
        {key: 'dat_ssi', label: 'Date'},
        {key: 'description_ts', label: 'Description'},
        {key: 'contributing_organization_ssi', label: 'Contributing Organization', facet: true},
        {key: 'type_ssi', label: 'Type', facet: true},
        {key: 'physical_format_ssi', label: 'Format', facet: true},
        {key: 'contributor_ssim', label: 'Contributor', delimiter: ', ', facet: true},
        {key: 'publishing_agency_ssi', label: 'Publishing Agency', facet: true},
        {key: 'dimensions_ssi', label: 'Dimensions', facet: true},
        {key: 'country_ssi', label: 'Country', facet: true},
        {key: 'state_ssi', label: 'State', facet: true},
        {key: 'city_ssim', delimiter: ', ', label: 'City', facet: true},
        {key: 'district_ssi', label: 'District', facet: true},
        {key: 'language_ssi', label: 'Language'},
        {key: 'rights_ssi', label: 'Rights', facet: true},
        {key: 'local_identifier_ssi', label: 'Local Identifier'},
        {key: 'identifier_ssi', label: 'MDL Identifier'},
        {key: 'collection_name_ssi', label: 'Collection Name', facet: true},
        {key: 'contact_information_ssi', label: 'Contact information'},
        {key: 'fiscal_sponsor_ssi', label: 'Fiscal Sponsor'},
        {key: 'geonam_ssi', label: 'GeoNames Identifier', facet: true},
        {key: 'collection_description_tesi', label: 'Collection Description'}
      ]
    end
  end
end
