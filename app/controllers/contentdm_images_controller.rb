class ContentdmImagesController < ApplicationController

  def show
    send_data data, type: 'image/jpg', disposition: 'inline'
  end

  private

  def data
    ContentdmIIIF.new(*identifiers).load
  end

  def identifiers
    image_params['id'].split('/')
  end

  def image_params
    params.permit(:id)
  end

end
