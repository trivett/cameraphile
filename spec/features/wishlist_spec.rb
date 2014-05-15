require 'spec_helper'

def sign_in(email, password)
  visit("/")
  click_link("Login")
  fill_in("Email", with: email)
  fill_in("Password", with: password)

  page.find("input").click
end



def add_camera_to_wishlist
  visit("/")
  click_link("Camera Directory")
  page.find(".add-button").click
end

def remove_from_wishlist
  visit("/")
  click_link("Your Camera Wishlist")
  click_button("Remove from list")
end



feature "A user can add a camera to his or her wishlist" do
  background { User.create!(email: "bob@issatan.com", password: "12345678")}

  scenario "allow user to add camera from directory" do

    sign_in("bob@issatan.com", "12345678")

    add_camera_to_wishlist

    expect(current_user.wishlist.cameras.length).to eq(1)
  end

  # scenario "allow user to delete camera from wishlist" do

  #   user = FactoryGirl.create(:user)
  #   login_as(user, :scope => :user)

  #   add_camera_to_wishlist
  #   count = user.wishlist.cameras.count

  #   remove_from_wishlist

  #   expect(user.wishlist.cameras.length).to eq(count - 1)
  # end

end
