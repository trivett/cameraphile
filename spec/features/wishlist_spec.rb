require 'spec_helper'

# def sign_in(email, password)
#   visit("/")
#   click_link("Login")
#   fill_in("Email", with: email)
#   fill_in("Password", with: password)
#   click_button("Sign in")
# end



# def add_camera_to_wishlist
#   visit("/cameras")
#   click_button("Add to wishlist")
#   click_link("Your Camera Wishlist")

# end

# def remove_from_wishlist
#   visit("/")
#   click_link("Your Camera Wishlist")
#   click_button("Remove from list")
# end



# feature "A user can add a camera to his or her wishlist", :js => true  do
#     after{ Warden.test_reset! }


#   scenario "allow user to add camera from directory" do
#     bob = User.create(email: "bob@ga.lunch", password: "qwerty123456")


#     Camera.create(brand: "nikon", name: "Nikon D7000", megapixels: "16.2", memory_type: "Secure Digital, SDHC, SDXC", small_image_url: "https://farm2.staticflickr.com/1425/cameras/72157624846412485_model_small_a42574ca6e.jpg", large_image_url: "https://farm2.staticflickr.com/1425/cameras/72157624846412485_model_large_194e38d197.jpg")

#     sleep 3
#     login_as(bob, scope: :user)
#     add_camera_to_wishlist
#     expect(bob.wishlist.cameras.length).to eq(1)
#   end

#   # scenario "allow user to delete camera from wishlist" do

#   #   user = FactoryGirl.create(:user)
#   #   login_as(user, :scope => :user)

#   #   add_camera_to_wishlist
#   #   count = user.wishlist.cameras.count

#   #   remove_from_wishlist

#   #   expect(user.wishlist.cameras.length).to eq(count - 1)
#   # end

# end
