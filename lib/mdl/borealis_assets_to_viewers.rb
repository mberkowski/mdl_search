module MDL
  class BorealisAssetsToViewers
    attr_reader :assets, :seadragon_klass
    def initialize(assets: [], seadragon_klass: MDL::BorealisOpenSeadragon)
      @seadragon_klass = seadragon_klass
      @assets          = assets
    end

    def viewers
      combined_viewers.sort {|a, b| (a['focus']) ? -1 : 1 }
    end

    private

    def combined_viewers
      non_image_viewers + openseadragon_viewer
    end

    def non_image_viewers
      non_images.map { |asset| asset.to_viewer }
    end

    def openseadragon_viewer
      [seadragon_klass.new(images: images).to_viewer]
    end


    # Images are special: they are all gathered under one asset object for the
    # OpenSeadragon viewer to handle
    def images
      [assets.find_all { |asset| asset.is_a? MDL::BorealisImage }].flatten
    end

    def non_images
      [assets.find_all { |asset| !asset.is_a? MDL::BorealisImage }].flatten
    end
  
  end
end