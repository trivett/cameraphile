// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require jquery.ui.sortable
//= require jquery.mixitup
//= require turbolinks
//= require masonry/jquery.masonry
//= require bootstrap
//= require icheck.min
//= require_tree .

var readyFunction;
var mason;
readyFunction = function() {
  $(".navbar-collapse").css("z-index", "5");
  $('#Container').mixItUp();
  $("#comparison-tool").sortable({ axis: "x" });

  $(".pics-container").mixItUp({
    layout: {
      display: 'block'
    }
  });

   $(function(){
    $('#masonry-container').masonry({
      itemSelector: '.box',
      columnWidth: 100,
      gutterWidth: 10
    });
    $("#main").css("z-index", "0");
    console.log("masonry firing")
  });


};


console.log("before doc ready");



$(document).ready(readyFunction);
console.log("between doc ready and page load");

$(document).on('page:load', readyFunction);

console.log("page load");



