require "spec_helper"

describe Wishlist do

  it { should belong_to(:user)}
  it { should have_and_belong_to_many(:cameras) }

end
