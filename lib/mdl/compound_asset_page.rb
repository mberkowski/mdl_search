require 'digest/sha1'
require 'json'

module MDL
  class CompoundAssetPage < CompoundAsset
    include ActionView::Helpers::AssetTagHelper
    include ActionView::Helpers::UrlHelper

    def title
      document[:pagetitle]
    end

    def format
      document[:pagefile].split('.').last
    end

    def filename
      document[:pagefile]
    end

    def document_id
      document[:id]
    end

    def id
      document[:pageptr]
    end

    def menu_link
      link_to menu_link_title, "/catalog/#{document_id}?compound=#{id}#compound-#{id}", id:  menu_link_id
    end

    private

    def menu_link_title
      raw "<div class=\"menu-title\">#{title}</div> #{thumbnail_image}"
    end

    def thumbnail_image
      image_tag thumbnail, title: title, 'data-toggle' => 'tooltip', 'data-placement' => 'top'
    end

    def menu_link_id
      "#{viewer}-#{collection}-#{id}-#{filename}"
    end

  end
end