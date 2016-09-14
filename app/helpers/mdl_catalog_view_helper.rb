require 'json'
module MdlCatalogViewHelper

  def render_asset_viewer(item)
    render "catalog/viewers/#{item.viewer}", item: item, js: false
  end

  def desolerize(document)
    document = document.transform_keys{ |key| key.gsub(/_([a-z])*$/, '').to_sym }.symbolize_keys
    if document[:compound_objects]
      document[:compound_objects] = JSON.parse(document[:compound_objects]).map(&:symbolize_keys)
    end
    document
  end

  private


  def compounds(document)
    MDL::CompoundAsset.new(desolerize(document))
  end

  # TODO: include id and collection in the contentdm extractor for each compound item
  # And remove adding it here
  def compounds_with_identifiers(document)
    collection, id = identifiers(document)
    compound_items(document).map { |item| item.merge("id" => id, "collection" => collection) }
  end


  def identifiers(document)
    document['id'].split('/')
  end
end