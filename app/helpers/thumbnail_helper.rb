module ThumbnailHelper
  def cached_thumbnail_tag(document, image_options = nil)
    image_tag thumbnail_path(document['id'], type: document['type_ssi'])
  end
end