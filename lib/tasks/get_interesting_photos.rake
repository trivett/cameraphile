
desc "This task is called by the Heroku scheduler add-on"

task :get_interesting_photos => :environment do

  puts "Grabbing photos from flickr"
  Photo.get_interesting_photos
  puts "done."

end

task :try_to_get_data => :environment do

  Photo.try_to_get_data

end
