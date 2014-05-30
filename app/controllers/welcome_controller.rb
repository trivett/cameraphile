class WelcomeController < ApplicationController

  def index
    @photos = Photo.all.sample(30)
  end

end
