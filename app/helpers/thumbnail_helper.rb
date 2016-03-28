module ThumbnailHelper

  def cached_thumbnail_tag(document, image_options)
    image_tag  thumbnail_path(*document['id'].split(':'))
  end

end