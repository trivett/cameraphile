class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_one :wishlist
  has_many :cameras, through: :wishlists


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # after_create do ####### this is what adam suggested
  #   self.create_wishlist
  # end

  before_validation(on: :create) do
    self.wishlist = Wishlist.new
  end

end
