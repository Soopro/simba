# -------------------------------
# Simba Javascript
#
# Description: A Theme for soopro.com
# http://www.soopro.com
#
# Author:   redy
# Date:     3 July 2015
# Version: 2.5
# -------------------------------
duplicateElements = ->
  elements = $('[duplicate]')
  for el in elements
    times = parseInt($(el).attr('duplicate'))
    curr = 0
    parent = $(el).parent()
    while curr < times-1
      parent.append($(el).clone())
      curr++
    

$(document).ready ->
  # svg sprites
  svgSet = new svgSprites()
  svgSet.load('../styles/svgdefs.svg', 'base')
  svgSet.render()
  
  duplicateElements()
  
  viewStatus = 0
  
  # header
  PrimaryHeader = ->
    self = @
    svg = $('#menu').find('svg')
    logo = $('#logo').find('svg')

    @menu = (type)->
      if viewStatus isnt 0 or not type
        viewStatus = 0
        new_sprite = svg.data('last')
        if new_sprite
          svg.data('last', '')
      
          svg.attr('svg-sprite', new_sprite)
          svgSet.render(svg)
        logo.removeClass('hide')
      else
        viewStatus = if type is 'close' then 1 else 2
        new_sprite = svg.data(type)
        old_sprite = svg.attr('svg-sprite') or ''
        svg.data('last', old_sprite)
        svg.attr('svg-sprite', new_sprite)
        svgSet.render(svg)
        if viewStatus is 2
          logo.addClass('hide')
        else
          logo.removeClass('hide')
      
    @show = ->
      if currPage.attr('dark') isnt null and viewStatus isnt 1
        $('#header').addClass('dark')
      else
        $('#header').removeClass('dark')
  
    return @
  
  # detailCtrl
  Detail = ->
    self = @
    detail = $('#detail')

    @show = (content)->
      if currPage.attr('dark') isnt null
        detail.addClass('dark')
      else
        detail.removeClass('dark')
        
      detail.html(content)
      detail.addClass('open')
    
    @hide = ->
      detail.removeClass('open')
      
    @toggle = ->
      if detail.hasClass('open')
        self.hide()
      else
        self.show()

    return @
    
  # sliderCtrl
  Slider = ->
    self = @
    top_margin = 30
    slider = $('#slider')
    slide_room = $('#slider .slides')
    slider_inner = $('#slider .slider-inner')
    
    slideIndex = 0
    totalSlides = 0
    
    btn_next = $('#slider .btn-next')
    btn_prev = $('#slider .btn-prev')
  
    btn_next.on 'click', (e)->
      self.next()
  
    btn_prev.on 'click', (e)->
      self.prev()
    
    @resize = (e)->
      for el in slide_room.children()
        el.style.maxHeight = ''
        el.style.maxWidth = ''
        
        _h = slider_inner.height()-top_margin;
        _w = slider_inner.width()
        if _w > _h
          p = _h / _w
          el.style.maxHeight = _h+"px"
          el.style.maxWidth = (_w * p)+"px"
        else
          p = _w / _h
          el.style.maxHeight = (_h * p)+"px"
          el.style.maxWidth = _w+"px"

    @slide = (index)->
      elements = slide_room.children()
      current = slide_room.find('.current')
      if current and elements.length > 0
        current.removeClass('current')
      $(elements[index]).addClass('current')
      return
    
    @next = ->
      if slideIndex >= totalSlides-1
        slideIndex = 0
      else
        slideIndex+=1
      self.slide(slideIndex)
      
    @prev = ->
      if slideIndex <= 0
        slideIndex = totalSlides-1
      else
        slideIndex-=1
      self.slide(slideIndex)
      
    @show = (elements)->
      if currPage.attr('dark') isnt null
        slider.addClass('dark')
      else
        slider.removeClass('dark')
      
      elements = elements.clone()
      slide_room.children().remove()
      slide_room.append(elements)
      
      $(elements[0]).addClass('current')
      slideIndex = 0
      totalSlides = elements.length
      self.resize()
      slider.addClass('open')
      window.addEventListener 'resize', self.resize
    
    @hide = ->
      # slide_room.children().remove()
      slider.removeClass('open')
      window.removeEventListener 'resize', self.resize
      
    @toggle = ->
      if slider.hasClass('open')
        self.hide()
      else
        self.show()

    return @
  
  
  # paginatorCtrl
  Paginator = ->
    self = @
    ctrl = $('#controller')
    btn_next = $('#controller .btn-next')
    btn_prev = $('#controller .btn-prev')
  
    btn_next.on 'click', (e)->
      self.next()
  
    btn_prev.on 'click', (e)->
      self.prev()
  
    @isHide = false
  
    @hide = ->
      btn_next.addClass('hide')
      btn_prev.addClass('hide')

    @show = ->
      if viewStatus isnt 0
        btn_prev.addClass('hide')
        btn_next.addClass('hide')
        return
      if currPageIndex > 0
        btn_prev.removeClass('hide')
      else
        btn_prev.addClass('hide')
      if currPageIndex < totalPages-1
        btn_next.removeClass('hide')
      else
        btn_next.addClass('hide')
      
      if currPage.attr('dark') isnt null
        ctrl.addClass('dark')
      else
        ctrl.removeClass('dark')
        
    @next = ->
      if currPageIndex >= totalPages-1
        return
      page_slide(currPageIndex+=1)
      
    @prev = ->
      if currPageIndex <= 0
        return
      page_slide(currPageIndex-=1)
      
    @toggle = ->
      if btn_next.hasClass('hide') or btn_prev.hasClass('hide')
        self.show()
      else
        self.hide()

    self.hide()
    self.show()
  
    return @
  

  # pages
  pages = $('#pages > section:not([disabled])')
  for page in pages
    $(page).append('<label>'+page.title+'</label>')
  
  totalPages = pages.length
  if totalPages > 0
    currPage = $(pages[0])
  else
    currPage = null
  currPageIndex = 0
  
  page_slide = (curr)->
    if not curr
      curr = 0
    currPageIndex = curr

    for page in pages
      idx = $(page).index()
      if idx == curr
        currPage = $(page)
      pos_left = 100*(idx-curr)
      $(page).css
        left: pos_left+'%'

    headerCtrl.show()
    paginatorCtrl.show()

  
  headerCtrl = new PrimaryHeader()
  paginatorCtrl = new Paginator()
  detailCtrl = new Detail()
  sliderCtrl = new Slider()
  
  # hanlders
  # ---------------------------------->

  # buttons
  pages.on 'click', (e)->
    next_page = e.currentTarget
    if viewStatus isnt 1 or not next_page
      return
    index = $(next_page).index()
    if index is currPageIndex
      $('#menu').trigger('click')
    else
      currPageIndex = index
      page_slide(currPageIndex)
    return
  

  $('#menu').on 'click', (e)->
    headerCtrl.menu('close')

    $('#pages').toggleClass('zoom').removeClass('out')
    detailCtrl.hide()
    sliderCtrl.hide()
    
    if viewStatus is 1
      $('#footer').removeClass('hide')
    else
      $('#footer').addClass('hide')

    headerCtrl.show()
    paginatorCtrl.toggle()
    return
  
  # open detail
  $('.open-detail').on 'click', (e)->
    headerCtrl.menu('collapse')
    
    $('#pages').toggleClass('zoom').toggleClass('out')
    $('#footer').addClass('hide')
    
    detail_id = $(this).data('detail')
    if detail_id
      detail_element = $('#'+detail_id+'[rel="detail"]')
    else
      detail_element = $(this).find('[rel="detail"]')

    if detail_element
      detail_content = detail_element.html()
    else
      detail_content = ''

    detailCtrl.show(detail_content)
    paginatorCtrl.hide()
    headerCtrl.show()
    return
  
  # open slider
  $('.open-slider').on 'click', (e)->
    headerCtrl.menu('collapse')
    
    $('#pages').toggleClass('zoom').toggleClass('out')
    $('#footer').addClass('hide')

    slides = $(this).find('[rel="slides"]')
    if not slides
      return

    sliderCtrl.show(slides.children())
    paginatorCtrl.hide()
    headerCtrl.show()
    return

  
  # common actions
  # ---------------------------------->
  common =
    prev: ->
      paginatorCtrl.prev()
    next: ->
      paginatorCtrl.next()
    enter: ->
      $('#menu').trigger('click')
    esc: ->
      headerCtrl.menu()

      $('#pages').removeClass('zoom').removeClass('out')
      detailCtrl.hide()
      sliderCtrl.hide()
      $('#footer').addClass('hide')
      paginatorCtrl.show()
      headerCtrl.show()
    
  # keyboard
  # ---------------------------------->
  $(document).on 'keydown', (e)->
    # left and up
    if e.keyCode in [37, 38]
      common.prev()
    else if e.keyCode in [39, 40]
      common.next()
    else if e.keyCode in [13, 32]
      common.enter()
    else if e.keyCode is 27
      common.esc()
  
  # hammer
  # ---------------------------------->
  
  touch_pages = document.getElementById('screen')
  touch_slider = document.getElementById('slider')
  touch_detail = document.getElementById('detail')
  
  mc = new Hammer(touch_pages)
  
  mc_slider = new Hammer(touch_slider)
  mc_slider.get('swipe').set direction: Hammer.DIRECTION_ALL
  
  mc_detail = new Hammer(touch_detail)
  mc_detail.get('swipe').set direction: Hammer.DIRECTION_ALL
  
  # listeners
  # mc.on 'swipeleft swiperight', (e) ->
  #   if viewStatus isnt 0
  #     return
  #   switch e.type
  #     when 'swipeleft' then common.next()
  #     when 'swiperight' then common.prev()
  #   return
  #
  mc.on 'panend', (e) ->
    if viewStatus is 2
      return
    screenWidth = $(document).width()
    mv = currPageIndex + Math.ceil((-e.deltaX / screenWidth)*(totalPages-1))
    if mv < 0
      mv = 0
    else if mv > totalPages - 1
      mv = totalPages - 1
    page_slide(mv) 
    return
  
  mc_slider.on 'swipedown', (e) ->
    common.esc()
  
  mc_detail.on 'swipedown', (e) ->
    common.esc()
  
  
  # start
  page_slide()
  