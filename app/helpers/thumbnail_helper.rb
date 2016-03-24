module ThumbnailHelper

  def cached_thumbnail_tag(document, image_options)
    collection, id = document['id'].split(':')
    image_tag  "http://reflections.mndigital.org/utils/getthumbnail/collection/#{collection}/id/#{id}"
    # image_tag "http://reflections.mndigital.org/utils/ajaxhelper/?CISOROOT=#{collection}&CISOPTR=#{id}&action=2&DMSCALE=5&DMWIDTH=200&DMHEIGHT=200&DMX=0&DMY=0&DMTEXT=&DMROTATE=0"
    # raw image_tag "https://server16022.contentdm.oclc.org/dmwebservices/index.php/utils/ajaxhelper/?CISOROOT=p16022coll9&CISOPTR=3466&action=2&DMSCALE=100&DMWIDTH=100&DMHEIGHT=100"
    # title = presenter(document).render_document_index_label document_show_link_field(document)
    # image_options = {class:"thumbnail", alt:title.strip, title:title.strip, property:"og:image"}.merge(image_options)
    # if has_thumbnail_field?(document)
    #   image_tag cached_thumbnail_url(url:thumbnail_url(document)), image_options
    # else
    #   image_tag DEFAULT_THUMBNAIL, image_options
    # end
  end

end