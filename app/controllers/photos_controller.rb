class PhotosController < ApplicationController

  def show
    @photo = Photo.find(params[:id])

    if Camera.where(:name => @photo.camera_model).first
      @camera = Camera.where(:name => @photo.camera_model).first
    elsif @photo.camera
      @camera = @photo.camera
    else
      @camera = Camera.where(:name => "Unknown").first
    end
  end


end
