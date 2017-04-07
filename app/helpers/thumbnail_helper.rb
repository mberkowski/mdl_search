module ThumbnailHelper
  def cached_thumbnail_tag(document, image_options = nil)
    image_tag thumbnail_path(document['id'], type: document['type_ssi'])
  end

  def thumbnail_link(document)
    link_to("#{document['title_ssi'].gsub(/'/, "\\'")} <br /> #{cached_thumbnail_tag(document)}".html_safe, "/catalog/#{document['id']}")
  end
end