require "spec_helper"

describe Camera do

  it { should have_and_belong_to_many(:wishlists) }
  it { should have_many(:photos) }
  it { should validate_uniqueness_of(:name)}

  subject(:camera){ Camera.create(id: 411, brand: "canon", model: "", name: "Canon EOS 60D", type: nil, megapixels: "18", memory_type: "CompactFlash (CF) Card", small_image_url: "https://farm4.staticflickr.com/3487/cameras/7215760...", large_image_url: "https://farm4.staticflickr.com/3487/cameras/7215760...", lcd_screen_size: "3", price: nil, asin: nil)}

  it "should get the price of the camera from Amazon" do
    camera.get_price
    expect(camera.price).to eq("$699.00")
  end

  it "should get the asin from Amazon" do
    camera.get_asin
    expect(camera.asin).to eq("B0040JHVCC")
  end

end
