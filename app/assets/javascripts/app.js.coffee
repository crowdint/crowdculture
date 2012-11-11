$(document).ready ->
  get_entries_per_page = ->
    per_page = 0
    if Modernizr.mq('only all and (max-width: 480px)') 
      per_page = 5
    else if Modernizr.mq('only all and (max-width: 1024px)') 
      per_page = 10
    else if Modernizr.mq('only all and (max-width: 1280px)') 
      per_page = 15
    else if Modernizr.mq('only all and (max-width: 1920px)') 
      per_page = 25
    else if Modernizr.mq('only all and (max-width: 2560px)') 
      per_page = 35
    else per_page = 10
    show_entries(per_page)

  show_entries = (per_page) ->
    $.ajax
      url: '/static_pages/show_entries'
      data: {page:1,per_page:per_page}

  get_entries_per_page()

  if Modernizr.touch                                    #if touchscreen
    if Modernizr.mq('only all and (max-width: 480px)')  #touchscreen w/small screen
      $("body").delegate ".box", "click", (e) ->
        $('.box').removeClass('show')
        $(this).addClass('show')
    else                                                #touchscreen w/big screen
      $("body").delegate ".box", "click", (e) ->
        $('.box').removeClass('show')
        $(this).addClass('show')

      $(".zoom").fancybox 
        beforeShow: ->
          @title = $(@element).attr("alt")      
  else                                                  #not touchscreen
    $(".zoom").fancybox
      beforeShow: ->
        @title = $(@element).attr("alt")
    $("body").delegate ".video", "click", ->
      $.fancybox
        padding: 0
        autoScale: false
        transitionIn: "none"
        transitionOut: "none"
        title: @title
        width: 600
        height: 400
        href: @href.replace(new RegExp("([0-9])", "i"), "moogaloop.swf?clip_id=$1")
        type: "swf"

      false

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
  load_more = (e) ->
    e.preventDefault()
    $('.loading').show()
    $(this).hide()
    page = $(this).attr("data-page")
    per_page = $(this).attr("data-ppage")
    $.ajax
      url: '/static_pages/show_entries'
      data: {page:page,per_page:per_page}

  
  $('#more-items').bind "click", load_more

  $('#more-items').bind "inview", (e, visible) ->
    if visible
      $('.loading').show()
      $(this).hide()
      page = $(this).attr("data-page")
      per_page = $(this).attr("data-ppage")
      $.ajax
        url: '/static_pages/show_entries'
        data: {page:page,per_page:per_page}
)

init_masonry = ->
  $container = $("#showcase-inner")
  gutter = 0
  min_width = 250
  $container.imagesLoaded ->
    $container.masonry
      itemSelector: ".box"
      gutterWidth: gutter
      isAnimated: false
      columnWidth: (containerWidth) ->
        num_of_boxes = (containerWidth / min_width | 0)
        box_width = ((containerWidth  / num_of_boxes) | 0)
        box_width = containerWidth  if containerWidth < min_width
        $(".box").width box_width
        $(".landscape").width box_width * 2 if num_of_boxes > 1
        box_width


