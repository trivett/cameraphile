require "open-uri"
class Photo < ActiveRecord::Base


  belongs_to :camera

  # validate for camera and flickr_id



  def get_photo_info
    # get basic photo info for photo

    full_url = "https://api.flickr.com/services/rest/?method=flickr.photos.getInfo&api_key=#{$KEY}&photo_id=#{self.flickr_id}&format=rest"
    raw_response = HTTParty.get(full_url)
    data = raw_response.to_hash
    photo_info = data["rsp"]["photo"]

    self.owner = photo_info["owner"]["realname"]
    self.title = photo_info["title"]
    self.photopage = photo_info["urls"]["url"]["__content__"]

    ## exif data request

    exif_response = open("https://api.flickr.com/services/rest/?method=flickr.photos.getExif&api_key=#{$KEY}&photo_id=#{self.flickr_id}&format=rest")
    exif_data = Crack::XML.parse(exif_response)

    self.camera_model = exif_data["rsp"]["photo"]["camera"]


    exif_data["rsp"]["photo"]["exif"].each do |item|
      if item["tag"] == "ExposureTime"
        self.exposure_time = item["raw"]
      end
      if item["tag"] == "FNumber"
        self.aperature = item["raw"]
      end
      if item["tag"] == "ISO"
        self.iso_speed = item["raw"]
      end
      if item["tag"] == "FocalLength"
        self.focal_length = item["raw"]
      end
      if item["tag"] == "Lens"
        self.lens = item["raw"]
      end
    end

    # get sizes for separate flickr request

  sizes_response = open("https://api.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key=#{$KEY}&photo_id=#{self.flickr_id}&format=rest")

  size_data = Crack::XML.parse(sizes_response)

  all_sizes = size_data["rsp"]["sizes"]["size"]

  all_sizes.each do |item|
    if item["label"] == "Large"
      self.photo_url = item["source"]
    end
  end
  self.save
end


end

