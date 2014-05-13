class WishlistsController < ApplicationController

  def show
    @cameras = current_user.wishlist.cameras.uniq

  end

end
