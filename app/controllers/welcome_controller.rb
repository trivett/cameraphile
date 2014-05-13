class WelcomeController < ApplicationController

  def index
    @photos = Photo.all.sample(100)
  end

end
