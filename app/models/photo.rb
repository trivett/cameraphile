require "open-uri"
class Photo < ActiveRecord::Base

  belongs_to :camera

  validates_uniqueness_of :flickr_id


  def get_owner_title_photopage
    full_url = "https://api.flickr.com/services/rest/?method=flickr.photos.getInfo&api_key=#{FLICKR_KEY}&photo_id=#{self.flickr_id}&format=rest"

    raw_response = HTTParty.get(full_url)
    data = raw_response.to_hash
    photo_info = data["rsp"]["photo"]

    self.owner = photo_info["owner"]["realname"]
    self.title = photo_info["title"]
    self.photopage = photo_info["urls"]["url"]["__content__"]
    self.save
  end

  def get_exif
    exif_response = open("https://api.flickr.com/services/rest/?method=flickr.photos.getExif&api_key=#{FLICKR_KEY}&photo_id=#{self.flickr_id}&format=rest")

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
    self.save
  end

  def get_jpeg_url
    sizes_response = open("https://api.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key=#{FLICKR_KEY}&photo_id=#{self.flickr_id}&format=rest")
    size_data = Crack::XML.parse(sizes_response)
    all_sizes = size_data["rsp"]["sizes"]["size"]
    all_sizes.each do |item|
      if item["label"] == "Large"
        self.photo_url = item["source"]
      end
    end
    self.save
  end

  # create_categories makes a string of space-separated types which will be used as classes in view

  def create_categories
    self.category = " "

    if self.focal_length.to_f > 75
      self.category << " telephoto"
    elsif self.focal_length.to_f < 35
      self.category << " macro"
    end

    if self.iso_speed.to_i > 1600
      self.category << " low-light"
    elsif self.iso_speed.to_i < 200
      self.category << " rich"
    end

    if self.aperature.to_f < 3.5
      self.category << " bokeh"
    elsif self.aperature.to_f > 16
      self.category << " landscape"
    end

    if self.exposure_time
      if Fractional.new(self.exposure_time) < 0.001
        self.category << " high-speed"
      elsif Fractional.new(self.exposure_time) > 0.06
        self.category << " long-exposure"
      end
    end

    self.save
  end

  # the following will be used by the chron job defined in ./config/schedule.rb
##############################################

# this method gets today's interesting photos from flickr

  def self.get_interesting_photos
  new_interesting_photos = []
    base = open("https://api.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=#{FLICKR_KEY}&format=rest")

    data = Crack::XML.parse(base)
    data_array = data["rsp"]["photos"]["photo"]

    data_array.each do |item|
       new_interesting_photos << Photo.create(flickr_id: item["id"])
    end
    return new_interesting_photos
  end


  # method for grabbing all the data for one photo

  def flesh_out_new_photos
    begin
      self.get_owner_title_photopage
      self.get_exif
      self.get_jpeg_url
      self.create_categories

      if Camera.where(:name => self.camera_model).count > 0
        self.camera = Camera.find_by(:name => self.camera_model)
        Camera.find_by(:name => self.camera_model).photos << self
      end

      self.save
    rescue
      puts ""
      puts "didn't work"
      puts ""
    else
      self.get_owner_title_photopage
      self.get_exif
      self.get_jpeg_url
      self.create_categories
     if Camera.where(:name => self.camera_model).count > 0
        self.camera = Camera.find_by(:name => self.camera_model)
        Camera.find_by(:name => self.camera_model).photos << self
      end

      self.save
    end
  end

  #Flickr's api sometimes takes a moment, so some things error out

  def try_to_get_data
    20.times do
      Photo.where(:photo_url => nil).each do |p|
        p.flesh_out_new_photos
      end
    end
    puts Photo.where(:photo_url => nil).count
    Photo.where(:photo_url => nil).each do |p|
      p.delete
    end
  end



end

