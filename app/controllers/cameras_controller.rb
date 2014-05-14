class CamerasController < ApplicationController

  def index
    @cameras = Camera.all
    @brands = Camera.all.pluck(:brand).uniq
  end

  def show
    @camera = Camera.find(params[:id])
    @photos = Photo.where(:camera_model => @camera.name)
  end

  def add_to_list

    @camera = Camera.find(params[:camera_id])
    @list = Wishlist.find(params[:wishlist_id])
    unless @list.cameras.include?(@camera)
      @list.cameras << @camera
    end
  end

  def remove_from_list
    @camera = Camera.find(params[:camera_id])
    @wishlist = Wishlist.find(params[:wishlist_id])
      @wishlist.cameras.delete(@camera)
    respond_to do |format|
      format.js {}
    end
  end



end
