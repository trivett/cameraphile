class WelcomeController < ApplicationController

  def index
    @photos = Photo.all.sample(50)
  end

end
