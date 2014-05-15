require 'spec_helper'

def add_camera_to_wishlist
  visit("/")
  click_link("Camera Directory")
  page.find(".add-button").click
end



feature "A user can add a camera to his or her wishlist" do



  scenario "allow user to add camera from directory" do

    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    add_camera_to_wishlist

    expect(user.wishlist.cameras.length).to eq(1)
  end
end
