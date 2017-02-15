module MDL
  class BorealisAssetsToViewers
    attr_reader :assets, :seadragon_klass
    def initialize(assets: [], seadragon_klass: MDL::BorealisOpenSeadragon)
      @seadragon_klass = seadragon_klass
      @assets          = assets
    end

    def viewers
      openseadragon_viewer.merge(non_image_viewers)
    end

    private

    def non_image_viewers
      non_images.inject({}) do |memo, asset|
        memo.merge(asset.to_viewer['type'] => asset.to_viewer)
      end
    end

    def openseadragon_viewer
      (seadragon) ? {"image" => seadragon} : {}
    end

    def seadragon
      (!images.empty?) ? seadragon_klass.new(images: images).to_viewer : nil
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