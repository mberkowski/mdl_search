module MDL
  class InitialPath
    attr_reader :format, :path_klass
    def initialize(format: format, path_klass: MDL::BorealisAssetMap)
      @format = format
      @path_klass = path_klass
    end

    def path
      path_klass.new(format_field: format).map.new.initial_path
    end
  end
end