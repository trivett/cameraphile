class PhotosController < ApplicationController

  def show
    @photo = Photo.find(params[:id])
    @camera = Camera.find_by(:name => @photo.camera_model) || Camera.where(:name => "Unknown")
  end


end
