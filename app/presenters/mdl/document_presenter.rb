module MDL
  class DocumentPresenter < BasePresenter
    presents :document

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
  end
end