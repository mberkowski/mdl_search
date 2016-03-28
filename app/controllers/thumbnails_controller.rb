class ThumbnailsController < ApplicationController
  before_action :thumbnail

  def show
    send_data data, type: 'image/jpg', disposition: 'inline'
  end

  def data
    if thumbnail.cached?
      thumbnail.cached_file
    else
      CacheThumbnailWorker.perform_async(thumbnail_params[:collection], thumbnail_params[:id])
      thumbnail.data
    end
  end

  private

  def thumbnail
    MDL::Thumbnail.new(collection: thumbnail_params[:collection], id: thumbnail_params[:id])
  end

  def thumbnail_params
    params.permit(:collection, :id)
  end

end
