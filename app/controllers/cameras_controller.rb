class CamerasController < ApplicationController

  def index

  if current_user
    @cameras = Camera.all - current_user.wishlist.cameras
  else
    @cameras = Camera.all
  end
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

    response.cache_control.replace(:no_cache => true)

    respond_to do |format|
      format.js {}
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
