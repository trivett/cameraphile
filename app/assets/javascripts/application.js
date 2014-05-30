
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require jquery.ui.sortable
//= require jquery.mixitup
//= require imagesloaded.min.js
//= require turbolinks
//= require masonry/jquery.masonry
//= require bootstrap
//= require icheck.min
//= require_tree .

var readyFunction;


readyFunction = function() {
  $(".navbar-collapse").css("z-index", "5");
  $('#Container').mixItUp();
  $("#comparison-tool").sortable({ axis: "x" });
  $(".pics-container").mixItUp({
    layout: {
      display: 'block'
    }
  });



  $('#masonry-container').masonry({
        itemSelector: '.box',
        columnWidth: 100,
        gutterWidth: 10

      });

   $(function(){

    $('#masonry-container img').hide();

    imagesLoaded($('#masonry-container'), function() {

      $('#masonry-container img').hide();

      $('#masonry-container').masonry({
        itemSelector: '.box',
        columnWidth: 100,
        gutterWidth: 10

      });

    });

    $('#masonry-container img').fadeIn(100);
    $("#main").css("z-index", "0");
    console.log("masonry firing");
  });
};



$(document).ready(readyFunction);
console.log("between doc ready and page load");

$(document).on('page:load', readyFunction);


