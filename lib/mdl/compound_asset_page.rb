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
      raw "<div>#{title}</div> #{image_tag thumbnail}"
    end

    def menu_link_id
      "#{viewer}-#{collection}-#{id}-#{filename}"
    end

  end
end