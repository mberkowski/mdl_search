require 'json'
module MdlCatalogViewHelper

  def menu_link_id(compound)
    "#{compound.viewer}-#{compound.collection}-#{compound.id}-#{compound.item_id}-#{compound.pagefile}"
  end

  def full_page_thumbnail(compound)
    ContentdmIIIF.new(compound.collection, compound.item_id, 7, 200, 200).location
  end

  def render_compound(compound)
    render "catalog/viewers/compound_#{compound.viewer}_viewer", compound: compound
  end

  private

  def compounds(document)
    MDL::CompoundList.new(compounds_with_identifiers(document))
  end

  # TODO: include id and collection in the contentdm extractor for each compound item
  # And remove adding it here
  def compounds_with_identifiers(document)
    collection, id = identifiers(document)
    compound_items(document).map { |item| item.merge("id" => id, "collection" => collection) }
  end


  def identifiers(document)
    document['id'].split(':')
  end

  def compound_items(document)
    JSON.parse(document['compound_objects_ts'])
  end

end