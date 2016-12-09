module MDL
  class BorealisDocument
    attr_reader :document, :asset_klass
    def initialize(document: {}, asset_klass: BorealisAsset)
      @document    = document
      @asset_klass = asset_klass
    end

    def to_assets
      if compounds.empty?
        [asset(id: id,
               collection: collection,
               format: format,
               trascript: trascript(document))]
      else
        compounds.map do |object|
          asset(id: object[:pageptr],
                collection: collection,
                format: object[:pagefile].split('.').last,
                transcript: trascript(object))
        end
      end
    end

    private

    def trascript(doc)
      doc.fetch(:transc, '')
    end

    def compounds
      document.fetch(:compound_objects, [])
    end

    def id
      document[:id].split(':').last
    end

    def collection
      document[:id].split(':').first
    end

    def format
      document.fetch(:format, 'jp2')
    end

    def asset(id: '', collection: '', format: '', transcript: '')
      asset_klass.new(id: id,
                      collection: collection,
                      format: format,
                      transcript: transcript)
    end
  end
end