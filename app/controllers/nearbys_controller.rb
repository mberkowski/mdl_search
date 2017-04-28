class NearbysController < ApplicationController
  protect_from_forgery except: :show

  def show
    render json: Nearby.search(pt: coords, d: distance), :callback => params[:callback]
  end

  def coords
    params[:coordinates].gsub /\+/, '.'
  end

  def distance
    (params[:distance]) ? params[:distance] : 35
  end
end
