module MDL
  class InitialPath
    attr_reader :format_field, :path_klass
    def initialize(format: format_field, path_klass: MDL::BorealisAssetMap)
      @format = format_field
      @path_klass = path_klass
    end

    def path
      path_klass.new(format_field: format_field).map.new.initial_path
    end
  end
end