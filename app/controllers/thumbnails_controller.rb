class ThumbnailsController < ApplicationController
  before_action :thumbnail

  def show
    redirect_to url
  end

  def url
    if thumbnail.cached?
      # Route images through the rails assets APIs in order to get the
      # correct headers
      "/assets/thumbnails/#{thumbnail.filename}"
    else
      CacheThumbnailWorker.perform_async(collection, id, params[:type])
      thumbnail.thumbnail_url
    end
  end

  private

  def thumbnail
    MDL::Thumbnail.new(collection: collection,
                       id: id, type: params[:type])
  end

  def collection
    params[:id].split(':').first
  end

  def id
    params[:id].split(':').last
  end

end
