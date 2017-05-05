module MDL
  class DocumentPresenter < BasePresenter
    presents :document

    def url(base_url)
      "#{base_url}#{initial_path}"
    end

    def title
      document.fetch('title_ssi', '[Missing Title]')
    end

    def title_short
      title.truncate(50, separator: /\s/)
    end

    def thumbnail
      "/thumbnails/#{document['id']}"
    end

    def description
      document['description_ts']
    end

    def initial_path
      MDL::InitialPath.new(format: document['format_ssi']).path
    end
  end
end