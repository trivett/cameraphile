require "spec_helper"

describe Photo do

  it { should validate_uniqueness_of(:flickr_id) }
  it { should belong_to(:camera)}

  subject(:pic){ Photo.create(flickr_id: "14000374440")}

  it "grabs owner, title, and flickr page url from flickr" do
    pic.get_owner_title_photopage
    expect(pic.owner).to eq("Andrew Moxom")
    expect(pic.title).to eq("Headstone")
    expect(pic.photopage).to eq("https://www.flickr.com/photos/32065742@N06/14000374440/")
  end

  it "grabs flickr exif data" do
    pic.get_exif
    expect(pic.camera_model).to eq("Fujifilm X-E1")
    expect(pic.exposure_time).to eq("1/2200")
    expect(pic.aperture).to eq("1.4")
    expect(pic.iso_speed).to eq("0")
    expect(pic.focal_length).to eq("35.0 mm")
    expect(pic.lens).to eq("XF35mmF1.4 R")
  end

  it "grabs embeddable jpeg url" do
    pic.get_jpeg_url
    expect(pic.photo_url).to eq("https://farm8.staticflickr.com/7426/14000374440_9750bf3d36_b.jpg")
  end

  it "creates categories based on exif data" do
    pic.get_exif
    pic.create_categories
    expect(pic.category).to eq("  rich bokeh high-speed")
  end

  it "can do those things with one method" do
    pic.flesh_out_new_photos

    expect(pic.owner).to eq("Andrew Moxom")
    expect(pic.title).to eq("Headstone")
    expect(pic.photopage).to eq("https://www.flickr.com/photos/32065742@N06/14000374440/")
    expect(pic.camera_model).to eq("Fujifilm X-E1")
    expect(pic.exposure_time).to eq("1/2200")
    expect(pic.aperture).to eq("1.4")
    expect(pic.iso_speed).to eq("0")
    expect(pic.focal_length).to eq("35.0 mm")
    expect(pic.lens).to eq("XF35mmF1.4 R")
    expect(pic.photo_url).to eq("https://farm8.staticflickr.com/7426/14000374440_9750bf3d36_b.jpg")
    expect(pic.category).to eq("  rich bokeh high-speed")
  end

  it "can grab a bunch of photos" do
    count = Photo.all.count
    Photo.get_interesting_photos
    expect(Photo.all.count).to eq(count + 100)
  end

  it "tries to get data from db" do
    Photo.get_interesting_photos
    count = Photo.all.count
    Photo.try_to_get_data
    expect(Photo.all.count).not_to eq(count)
  end
end
