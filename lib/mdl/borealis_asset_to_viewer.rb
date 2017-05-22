module MDL
  class BorealisAssetToViewer
    attr_reader :assets, :asset
    def initialize(assets: [], asset: '')
      @assets = assets
      @asset  = asset
    end

    def to_viewer
      viewer ? {asset.type => viewer} : {}
    end

    private

    def viewer_assets
      [assets.find_all { |asst| asst.is_a? asset.class }].flatten
    end

    def viewer
      (!viewer_assets.empty?) ? asset.viewer.new(assets: viewer_assets).to_viewer : nil
    end
  end
end