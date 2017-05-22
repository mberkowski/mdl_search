module MDL
  class BorealisAssetsToViewers
    attr_reader :assets, :to_viewer_klass
    def initialize(assets: [], to_viewer_klass: MDL::BorealisAssetToViewer)
      @assets          = assets
      @to_viewer_klass = to_viewer_klass
    end

    def viewers
      assets.inject({}) do |memo, asset|
        memo.merge(to_viewer(asset))
      end
    end

    private

    def to_viewer(asset)
      to_viewer_klass.new(asset: asset, assets: assets).to_viewer
    end
  end
end