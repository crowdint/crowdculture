$(function() {
  $('#btn-about').toggle(function () {
    $(this).addClass('btn-close');
    $("aside#about").addClass('active-mode');
    $("aside#about p").slideDown(400);
  },function () {
    $(this).removeClass('btn-close');
    $("aside#about").removeClass('active-mode');
    $("aside#about p").slideUp(400);
  });
  $("#to-top, #helper p a").click(function() {
    $('html,body').animate({scrollTop : 0},'slow');
    return false;
  });
});

window.onload = (function(){
  $(window).scroll(function () { 
    if( $(window).scrollTop() > 340 ) {
      $("#helper").slideDown(100);
    } else {
      $("#helper").slideUp(100);
    }
  });
});

$(document).ready(function(){
	$(".zoom").fancybox();
    init_masonry();
});

function init_masonry(){
    var $container = $('#showcase-inner');
    var gutter = 0;
    var min_width = 250;
    $container.imagesLoaded( function(){
        $container.masonry({
            itemSelector : '.box',
            gutterWidth: gutter,
            isAnimated: true,
              columnWidth: function( containerWidth ) {
                var num_of_boxes = (containerWidth/min_width | 0);
                var box_width = (((containerWidth - (num_of_boxes-1)*gutter)/num_of_boxes) | 0) ;
                if (containerWidth < min_width) {
                    box_width = containerWidth;
                }
                $('.box').width(box_width);
                return box_width;
              }
        });
    });
}