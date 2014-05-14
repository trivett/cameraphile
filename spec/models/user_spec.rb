require "spec_helper"

describe User do

  it { should validate_uniqueness_of(:email) }
  it { should have_one(:wishlist) }

  subject(:barry){User.create(email: "barry@email.com")}

  it "should initialize with a wishlist" do
    expect(barry.wishlist.nil?).to be false
  end

end
