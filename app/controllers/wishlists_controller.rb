class WishlistsController < ApplicationController

  def show
    @cameras = current_user.wishlist.cameras
    @types = ["long-exposure", "high-speed", "landscape", "bokeh", "rich", "low-light", "macro", "telephoto"]
  end

end
