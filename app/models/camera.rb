class Camera < ActiveRecord::Base
  has_and_belongs_to_many :wishlists
  has_many :photos


end
