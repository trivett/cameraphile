
require "httparty"

Camera.delete_all

    brands =  [
    "apple",
    "sony",
    "samsung",
    "panasonic",
    "fujifilm",
    "htc",
    "pentax",
    "kodak",
    "casio",
    "leica",
    "sonyericsson",
    "nikon",
    "blackberry",
    "minolta",
    "motorola",
    "gopro",
    "ricoh",
    "hp",
    "sigma",
    "phaseone",
    "sanyo",
    "benq",
    "kddi",
    "lg",
    "toshiba",
    "nintendo",
    "epson",
    "kyocera",
    "docomo",
    "polaroid",
    "vivitar",
    "palm",
    "google",
    "sharp",
    "acer",
    "jvc",
    "concord",
    "leaf",
    "helio"
  ]



def add_cameras(brand)
  full_url = "https://api.flickr.com/services/rest/?method=flickr.cameras.getBrandModels&api_key=#{$KEY}&brand=#{brand}"
  raw_response = HTTParty.get(full_url)
  data = raw_response.to_hash
  brand_array = data["rsp"]["cameras"]["camera"]

  brand_array.each do |camera|
      Camera.create(
        brand: brand,
        name: camera["name"],
        small_image_url: camera["images"]["small"],
        large_image_url: camera["images"]["large"]
        # megapixels: camera["details"]["megapixels"],
        # lcd_screen_size: camera["details"]["lcd_screen_size"],
        # memory_type: camera["details"]["memory_type"]
        )
  end

end

brands.each do |b|
  add_cameras(b)
end
