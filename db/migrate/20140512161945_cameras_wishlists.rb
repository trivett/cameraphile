class CamerasWishlists < ActiveRecord::Migration
  def change
    create_table :cameras_wishlists do |t|
      t.belongs_to :wishlist
      t.belongs_to :camera
    end
  end
end
