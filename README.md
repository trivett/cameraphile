#CameraPhile
##A tool for comparing digital cameras based on pictures taken with them.

This app solves the problem of comparison shopping for cameras. If you are in the market for a new camera, or you just like to envy other people's toys, you can look at recent interesting pictures taken with them alongside price and product information.

###How it works

Every day, CameraPhile pulls the 100 most interesting photos from Flickr, and grabs their metadata such as ISO speed, aperture, shutter speed, lens, and focal lenght. It then connects the photo to the camera that took it. You can look at a directory of cameras and filter them by brand.

If you like what you see and you want the camera, add it to your wishlist. Whe you look at your wishlist, you can see pictures taken with that camera and filter the images based on what sort of photo they are. Each photo has properties you can filter for such as bokeh, telephoto, landscape and high speed. Those properties are extrapolated from the metadata. For instance, a photo taken with a shutter speed of 1/2000 sec at f2.0 aperature qualifies for both high-speed and bokeh.

If you want to reorder your wish list, have at it.

Each camera has its price filled out thanks to Amazon. And hey, if you settled on a camera model, click the Amazon buy link. Because I can become filthy rich that way.

Keep coming back. every time you visit CameraPhile it looks a little different and there are probably lots of new photos to look at. If you really like the pictures, click the Flickr links to show the photographer some love.


###Technologies used

Here be a lot of jQuery.

This is a Ruby on Rails app, using Devise for authentication. Flickr data is imported through open-uri and HTTParty, some of which is parsed with Crack. Fractional, a very simple gem, made it slightly easier to parse fractions such as shutter speeds into decimals that my custom methods can do math with. The Amazon-Ecs gem facilitates getting info from Amazon. Figaro held the API keys for me.

The pretty stuff comes from some awesome jQuery plugins such as Masonry, which aligns the photos on the front page vertically. The photos are all the same general size, but randomly resized as they come in. Mixitup is what allows the app to filter according to the user's taste. JQuery UI lets you sort things.

###Tests

According to SimpleCov, I am 97.91% covered by Rspec unit tests and Shoulda Matchers. Due to unforeseen complications, acceptance tests are still forthcoming.

####[ERD](https://raw.githubusercontent.com/trivett/cameraphile/master/erd.pdf)



###Process

I was all alone on this one, but the user story board on [Trello](https://trello.com/b/HDKSdEEH/cameraphile) helped keep me on track.





