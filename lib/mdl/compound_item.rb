require 'digest/sha1'
require 'json'

module MDL
  class CompoundItem < Item
    include ActionView::Helpers::AssetTagHelper
    include ActionView::Helpers::UrlHelper

    attr_reader :record

    def thumbnail
      "http://reflections.mndigital.org/utils/getthumbnail/collection/#{collection}/id/#{page_id}"
    end

    def page_title
      record[:pagetitle]
    end

    def format
      record[:pagefile].split('.').last
    end

    def filename
      record[:pagefile]
    end

    def page_id
      record[:pageptr]
    end

    def collection
      record[:collection]
    end

    def menu_link
      link_to menu_link_title, "/catalog/#{id}?compound=#{page_id}#compound-#{page_id}", id:  menu_link_id
    end

    def menu_link_title
      raw "<div>#{page_title}</div> #{image_tag thumbnail}"
    end

    def full_page_thumbnail
      ContentdmIIIF.new(collection, page_id, 3, 175, 175).location
    end

    def menu_link_id
      "#{viewer}-#{collection}-#{id}-#{page_id}-#{filename}"
    end

  end
end