
require "httparty"
require "open-uri"




# Camera.create(brand: "canon", name: "Canon EOS 5D Mark II", megapixels: "21.1", memory_type: "CompactFlash (CF) Card", small_image_url: "https://farm4.staticflickr.com/3154/cameras/72157607348761901_model_small_a874952616.jpg", large_image_url: "https://farm4.staticflickr.com/3154/cameras/72157607348761901_model_large_97198e11ef.jpg", price: "$2895")

# Camera.create(brand: "nikon", name: "Nikon D7000", megapixels: "16.2", memory_type: "Secure Digital, SDHC, SDXC", small_image_url: "https://farm2.staticflickr.com/1425/cameras/72157624846412485_model_small_a42574ca6e.jpg", large_image_url: "https://farm2.staticflickr.com/1425/cameras/72157624846412485_model_large_194e38d197.jpg")



def add_cameras(brand)
  full_url = "https://api.flickr.com/services/rest/?method=flickr.cameras.getBrandModels&api_key=#{FLICKR_KEY}&brand=#{brand}"
  raw_response = HTTParty.get(full_url)
  data = raw_response.to_hash
  brand_array = data["rsp"]["cameras"]["camera"]

  brand_array.each do |camera|
      Camera.create(
        brand: brand,
        name: camera["name"],
        small_image_url: camera["images"]["small"],
        large_image_url: camera["images"]["large"],
        megapixels: camera["details"]["megapixels"],
        lcd_screen_size: camera["details"]["lcd_screen_size"],
        memory_type: camera["details"]["memory_type"]
        )
  end

end

brands =  ["apple","sony","samsung","panasonic","fujifilm","htc","pentax","kodak","casio","leica","sonyericsson","nikon","blackberry","minolta","motorola","gopro","ricoh","hp","sigma","phaseone","sanyo","benq","kddi","lg","toshiba","nintendo","epson","kyocera","docomo","polaroid","vivitar","palm","google","sharp","acer","jvc","concord","leaf","helio"]

brands.each do |b|
  begin
    add_cameras(b)
  rescue
    puts "didn't work (camera)"
  else
    puts "worked (camera)"
  end
end



