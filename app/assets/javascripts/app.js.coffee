$(document).ready ->
  if Modernizr.touch
    $('.box a').css('visibility','hidden')
    $(".box").live "click", (e) ->
      $('.box a').css('visibility','hidden')
      $(this).children().children().eq(2).children().css('visibility','visible')

    $(".zoom").fancybox()
    $(".zoom").fancybox 
      beforeShow: ->
        @title = $(@element).attr("alt")
      beforeClose: ->
        $('.box a').css('visibility','hidden')
  else
    $(".zoom").fancybox()
    $(".zoom").fancybox 
      beforeShow: ->
        @title = $(@element).attr("alt")

  init_masonry()
  
  $ ->
    $("#btn-about").toggle (->
      $(this).addClass "btn-close"
      $("aside#about").addClass "active-mode"
      $("aside#about p").slideDown 400
    ), ->
      $(this).removeClass "btn-close"
      $("aside#about").removeClass "active-mode"
      $("aside#about p").slideUp 400

    $("#to-top, #helper p a").change ->
      $("html,body").animate
        scrollTop: 0
      , "slow"
      false

  $(window).scroll ->
    if $(window).scrollTop() > 340
      $("#helper").slideDown 100
    else
      $("#helper").slideUp 100

window.onload = (->
  $("a.hook").bind "inview", (e, visible) ->
    if visible
      $.getScript $(this).attr("href")
      $(this).text('Loading..');

)

init_masonry = ->
  $container = $("#showcase-inner")
  gutter = 0
  min_width = 250
  $container.imagesLoaded ->
    $container.masonry
      itemSelector: ".box"
      gutterWidth: gutter
      isAnimated: true
      columnWidth: (containerWidth) ->
        num_of_boxes = (containerWidth / min_width | 0)
        box_width = (((containerWidth - (num_of_boxes - 1) * gutter) / num_of_boxes) | 0)
        box_width = containerWidth  if containerWidth < min_width
        $(".box").width box_width
        box_width


