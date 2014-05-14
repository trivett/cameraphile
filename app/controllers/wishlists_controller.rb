class WishlistsController < ApplicationController

  def show
    @cameras = current_user.wishlist.cameras

  end

end
