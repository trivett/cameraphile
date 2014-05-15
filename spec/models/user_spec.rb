require "spec_helper"

describe User do

  it { should validate_uniqueness_of(:email) }
  it { should have_one(:wishlist) }

  let(:barry){User.create(email: "barry@email.com", password: "12345678")}

  it "should initialize with a wishlist" do
    expect(barry.wishlist.nil?).to be false
  end

end
