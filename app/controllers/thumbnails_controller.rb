class ThumbnailsController < ApplicationController
  before_action :thumbnail

  def show
    send_data data, type: 'image/jpg', disposition: 'inline'
  end

  def data
    if thumbnail.cached?
      thumbnail.cached_file
    else
      CacheThumbnailWorker.perform_async(collection, id, params[:type])
      thumbnail.data
    end
  end

  private

  def thumbnail
    MDL::Thumbnail.new(collection: collection, id: id, type: params[:type])
  end

  def collection
    params[:id].split(':').first
  end

  def id
    params[:id].split(':').last
  end

end
