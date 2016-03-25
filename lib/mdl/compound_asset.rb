module MDL
  class CompoundAsset < Asset

    def pages
      @pages ||= document[:compound_objects].map { |record| CompoundAssetPage.new(document.merge(record.symbolize_keys)) }
    end

    def with_page_id(id = nil)
      return pages.first unless id
      pages.find { |pages| pages.id == id  }
    end

  end
end