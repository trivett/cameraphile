require "spec_helper"

describe Camera do

  it { should have_and_belong_to_many(:wishlists) }
  it { should have_many(:photos) }

  subject(:camera){ Camera.create(brand: "canon", model: "", name: "Canon EOS 7D", type: nil, megapixels: 18, memory_type: "CompactFlash (CF) Card", small_image_url: "https://farm4.staticflickr.com/3487/cameras/72157602280763141_model_small_d6e5af0712.jpg", large_image_url: "https://farm4.staticflickr.com/3487/cameras/72157602280763141_model_large_1f77f7e0f2.jpg", lcd_screen_size: "3", price: nil)}

  it "should get the price of the camera from Amazon" do
    camera.get_price
    expect(camera.price).to eq("$1,299.00")
  end

end
