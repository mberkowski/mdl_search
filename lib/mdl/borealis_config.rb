module MDL
  class BorealisConfig
    attr_reader :assets
    def initialize(assets: [])
      @assets = set_focus(assets)
    end

    def config
      if !images.empty?
        non_images_config.push(images_config)
      else
        non_images_config
      end
    end

    private

    def set_focus(assets)
      assets[0].focus = true
      assets
    end

    def non_images_config
      non_images.map { |asset| configure(default_config(asset)) }
    end

    def images_config
      default_config(image).merge(items:  [os_config, transcript])
    end

    def configure(config)
      case config['type']
      when 'video'
        return config.merge("height" => 500, "width" => 500)
      else
        return config
      end
    end

    # Images are special: they are all gathered under one asset object for the
    # OpenSeadragon viewer to handle
    def images
      assets.find_all { |asset| asset.type == 'image'}
    end

    def non_images
      assets.find_all { |asset| asset.type != 'image'}
    end

    def image
      images.first
    end

    def transcript
      {
        "type": "transcript",
        "label": "Transcript",
        "texts": images.map { |image| image.transcript },
        "focus": false
      }
    end

    def os_config      
      {
        "type": "image",
        "label": "Image",
        "focus": true,
        "include_controls": true,
        "sequenceMode" => true,
        "showReferenceStrip" => true,
        "defaultZoomLevel" => 0,
        "minZoomLevel" => 0,
        "tileSources" => images.map { |image| image.src }
      }
    end

    def default_config(asset)
      if asset
        {
          "focus": asset.focus,
          "type": asset.type,
          "src": asset.src,
          "thumbnail": asset.thumbnail
        }
      else
        {}
      end
    end
  end
end