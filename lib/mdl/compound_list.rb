module MDL
  class CompoundList
    attr_reader :records
    def initialize(records)
      @records = records.map(&:symbolize_keys)
    end

    def compounds
      @compounds ||= records.map { |record| CompoundItem.new(record) }
    end

    def with_types(types)
      compounds.select { |item| types.include? item.type  }
    end

    def with_item_id(id = nil)
      return compounds.first unless id
      compounds.find { |compound| compound.item_id == id  }
    end

  end
end