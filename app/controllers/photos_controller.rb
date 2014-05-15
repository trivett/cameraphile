class PhotosController < ApplicationController

  def show
    @photo = Photo.find(params[:id])


      @camera = Camera.find_by(:name => @photo.camera_model)


    else
      @camera = Camera.where(:name => "Unknown").first
    end
  end


end
