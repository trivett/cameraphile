class PhotosController < ApplicationController

def show
  @photo = Photo.find(params[:id])
  @camera = Camera.where(:name => @photo.camera_model)
end


end
