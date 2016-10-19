module MDL
  class BorealisDocument
    attr_reader :document, :asset_klass
    def initialize(document: {}, asset_klass: BorealisAsset)
      @document    = document
      @asset_klass = asset_klass
    end

    def to_assets
      if compounds.empty?
        [asset(id: id, collection: collection, format: format)]
      else
        compounds.map do |object|
          asset(id: object[:pageptr],
                collection: collection,
                format: object[:pagefile].split('.').last)
        end
      end

    end

    private

    def compounds
      document.fetch(:compound_objects, [])
    end

    def id
      document[:id].split('/').last
    end

    def collection
      document[:id].split('/').first
    end

    def format
      document.fetch(:format, 'jp2')
    end

    def asset(id: '', collection: '', format: '')
      asset_klass.new(id: id,
                      collection: collection,
                      format: format)
    end
  end
end