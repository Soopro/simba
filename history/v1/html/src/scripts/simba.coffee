# -------------------------------
# Simba Javascript
#
# Description: A Theme for soopro.com
# http://www.soopro.com
#
# Author:   redy
# Date:     3 July 2015
# -------------------------------
$(document).ready ->

  viewStatus = 0
  touchStatus = 0
  
  # header
  PrimaryHeader = ->
    self = @
    svg = $('#menu').find('svg')
    logo = $('#logo').find('svg')
    btn_menu = $('#menu').find('.btn-menu')
    btn_close = $('#menu').find('.btn-close')
    btn_collapse = $('#menu').find('.btn-collapse')
    btn_collapse.hide()
    btn_close.hide()
    
    @menu = (type)->
      if viewStatus isnt 0 or not type
        viewStatus = 0
      else if type is 'close'
        viewStatus = 1
      else if type is 'collapse'
        viewStatus = 2
      
      switch viewStatus
        when 2
          logo.addClass('hide')
          btn_menu.hide()
          btn_collapse.show()
          btn_close.hide()
        when 1
          logo.removeClass('hide')
          btn_menu.hide()
          btn_collapse.hide()
          btn_close.show()
        when 0
          logo.removeClass('hide')
          btn_menu.show()
          btn_collapse.hide()
          btn_close.hide()
      
    @show = ->
      if currDisplayPage.hasClass('dark') and viewStatus isnt 1
        $('#header').addClass('dark')
      else
        $('#header').removeClass('dark')
  
    return @
  
  # detailCtrl
  Detail = ->
    self = @
    detail = $('#detail')

    @show = (content)->
      if currPage.hasClass('dark')
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
    slide_title = $('#slider .title')
    slide_room = $('#slider .slides')
    slider_inner = $('#slider .slider-inner')
    
    slideIndex = 0
    totalSlides = 0
    
    btn_next = $('#slider .btn-next')
    btn_prev = $('#slider .btn-prev')
    
    @isHide = false
    
    btn_next.on 'click', (e)->
      this.blur()
      self.next()
  
    btn_prev.on 'click', (e)->
      this.blur()
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
      if viewStatus isnt 2 or self.isHide
        return
      if slideIndex >= totalSlides-1
        slideIndex = 0
      else
        slideIndex+=1
      self.slide(slideIndex)
      
    @prev = ->
      if viewStatus isnt 2 or self.isHide
        return
      if slideIndex <= 0
        slideIndex = totalSlides-1
      else
        slideIndex-=1
      self.slide(slideIndex)
      
    @show = (elements, title)->
      if currPage.hasClass('dark')
        slider.addClass('dark')
      else
        slider.removeClass('dark')
      
      slide_title.html(title or '')
      
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
      this.blur()
  
    btn_prev.on 'click', (e)->
      self.prev()
      this.blur()
  
    @isHide = false
  
    @hide = ->
      btn_next.addClass('hide')
      btn_prev.addClass('hide')

    @show = ->
      if viewStatus isnt 0
        btn_prev.addClass('hide')
        btn_next.addClass('hide')
        return
      if currDisplayIndex > 0
        btn_prev.removeClass('hide')
      else
        btn_prev.addClass('hide')
        
      if currDisplayIndex < totalPages-1
        btn_next.removeClass('hide')
      else
        btn_next.addClass('hide')
      
      if currDisplayPage.hasClass('dark')
        ctrl.addClass('dark')
      else
        ctrl.removeClass('dark')
        
    @next = ->
      if viewStatus is 2
        return
      if currPageIndex >= totalPages-1
        return
      page_slide(currPageIndex+1)
      
    @prev = ->
      if viewStatus is 2
        return
      if currPageIndex <= 0
        return
      page_slide(currPageIndex-1)
      
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
  currDisplayIndex = 0
  currDisplayPage = currPage
  
  init = ->
    stopPagesAnim()
    hash = window.location.hash
    if hash
      anchor = hash.replace('#/', '')
      for page in pages
        if $(page).attr('parallax-anchor') == anchor
          page_slide($(page).index())
          return

    page_slide(currPageIndex)
  
  stopPagesAnim = ->
    pages.addClass('no-transition')
    timer = window.setTimeout ->
      pages.removeClass('no-transition')
      window.clearTimeout(timer)
    , 50
  
  window.addEventListener 'resize', (e)->
    stopPagesAnim()
    page_slide(currPageIndex)


  page_open = ->
    headerCtrl.menu()
    $('#pages').removeClass('zoom').removeClass('out')
    detailCtrl.hide()
    sliderCtrl.hide()
    $('#footer').addClass('hide')
    paginatorCtrl.show()
    headerCtrl.show()  
  
  
  page_slide = (curr)->
    if not curr
      curr = 0

    screenWidth = $(document).width()
    currPageIndex = currDisplayIndex = curr
    
    for page in pages
      idx = $(page).index()
      if idx == curr
        currDisplayPage = currPage = $(page)
        anchor = $(page).attr('parallax-anchor') or idx

      pos_left = screenWidth*(idx-curr)
      $(page).css
        left: pos_left+'px'

    headerCtrl.show()
    paginatorCtrl.show()
    if anchor is 0
      location.hash = ''
    else
      location.hash = "#/" + anchor
  
  
  page_move = (mv, curr)->
    pages.addClass('on-moving')
    # If not addClass/removeClass the animation will turn to very strange.
    # only happend on chrome for now.
    # Seems the css transition is conflict, or juse my chorme go stupid.
    # I really don't know why. 
    # It's OK if removeClass right after addClass,
    # I put remove at last just looks like make sense...
    # the problem may be cause pan event cycle.
    
    if not mv
      return
      
    screenWidth = $(document).width()
    last_left = null
    for page in pages
      idx = $(page).index()
      
      pos_left = Math.round(screenWidth*idx+mv - (screenWidth*curr))
      $(page).css
        left: pos_left+'px'

      if not last_left or Math.abs(pos_left) < Math.abs(last_left)
        last_left = pos_left
        currDisplayIndex = idx
        currDisplayPage = $(page)

    pages.removeClass('on-moving')
    headerCtrl.show()
    paginatorCtrl.show()
  
  headerCtrl = new PrimaryHeader()
  paginatorCtrl = new Paginator()
  detailCtrl = new Detail()
  sliderCtrl = new Slider()
  
  # hanlders
  # ---------------------------------->

  # buttons
  # pages.on 'click', (e)->
  #   next_page = e.currentTarget
  #   if viewStatus isnt 1 or not next_page
  #     return
  #   index = $(next_page).index()
  #   if index isnt currPageIndex
  #     page_slide(index)

  $('[rel="parallax-anchor"]').on 'click', (e)->
    element = $(e.currentTarget or e.target)
    anchor = element.attr('href').split("#", 2)[1]
    if not anchor
      return
    for page in pages
      if $(page).attr('parallax-anchor') == anchor
        idx = $(page).index()
        break
    next_idx = idx or 0
    if currPageIndex == next_idx
      page_open()
    else
      page_slide(next_idx)
      timer = window.setTimeout ->
        page_open()
        window.clearTimeout(timer)
      , 600
      return false
    
  $('#menu').on 'click', (e)->
    this.blur()
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
    title = slides.attr('title')
    if not slides
      return

    sliderCtrl.show(slides.children(), title)
    paginatorCtrl.hide()
    headerCtrl.show()
    e.stopPropagation()
    return false

  
  # cmd actions
  # ---------------------------------->
  cmd =
    prev: ->
      paginatorCtrl.prev()
    next: ->
      paginatorCtrl.next()
    slide_prev: ->
      sliderCtrl.prev()
    slide_next: ->
      sliderCtrl.next()
    enter: ->
      $('#menu').trigger('click')
    esc: ->
      page_open()
    
  # keyboard
  # ---------------------------------->
  $(document).on 'keydown', (e)->
    if e.keyCode in [37, 38]
      if viewStatus isnt 2
        cmd.prev()
      else
        cmd.slide_prev()
    else if e.keyCode in [39, 40]
      if viewStatus isnt 2
        cmd.next()
      else
        cmd.slide_next()
    else if e.keyCode in [13, 32]
      cmd.enter()
    else if e.keyCode is 27
      cmd.esc()
  
  # wheel
  # ---------------------------------->
  wheeltimer = null
  $(document).on 'wheel', (e)->
    move_to = Math.round(e.deltaY / 5)
    if move_to is 0
      return

    if wheeltimer
      window.clearTimeout(wheeltimer)
    wheeltimer = window.setTimeout ->
      if viewStatus is 2
        if move_to > 0
          cmd.slide_next()
        else
          cmd.slide_prev()
      else
        if move_to > 0
          cmd.next()
        else
          cmd.prev()
    , 60
    
    
  
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
  #   if viewStatus isnt 2
  #     return
  #   switch e.type
  #     when 'swipeleft' then cmd.next()
  #     when 'swiperight' then cmd.prev()
  #   return

  isTouchPan = (target)->
    # prevent element don't want pan to slide
    for item in $('[no-touch-pan]')
      if $.contains(item, target)
        return false
    return true
        
  mc.on 'panleft panright', (e) ->
    if viewStatus is 2 and isTouchPan(e.target)
      return
    
    if viewStatus is 0
      recoup = 2
    else if viewStatus is 1
      recoup = 4
    
    move_to = e.deltaX*recoup
      
    screenWidth = $(document).width()
    _screen_w_10 = Math.ceil(screenWidth / 10)
    if move_to >= 0
      _left = currPageIndex * screenWidth + _screen_w_10
      if move_to > _left
        move_to = _left
    else
      _right = (currPageIndex - totalPages + 1) * screenWidth - _screen_w_10
      if move_to < _right
        move_to = _right

    page_move(move_to, currPageIndex)
    return

  mc.on 'panend', (e) ->
    if viewStatus is 2 and isTouchPan(e.target)
      return
    page_slide(currDisplayIndex)
    return

  mc.on 'tap pressup', (e)->
    if e.target not in pages
      return
    next_page = e.target
    if viewStatus isnt 1 or not next_page
      return
    next_idx = $(next_page).index()
    if next_idx == currPageIndex
      $('#menu').trigger('click')
    else
      page_slide(next_idx)
  
  mc_slider.on 'swipedown', (e) ->
    if viewStatus isnt 2
      return
    cmd.esc()
  
  mc_slider.on 'swipeleft swiperight', (e) ->
    if viewStatus isnt 2
      return
    switch e.type
      when 'swipeleft' then cmd.slide_next() 
      when 'swiperight' then cmd.slide_prev()
    return
  
  mc_detail.on 'swipedown', (e) ->
    if viewStatus isnt 2
      return
    cmd.esc()
  
  # leap motion
  leapLoopClock = 0
  CD_TIMER = 30
  leapController = Leap.loop
    enableGestures: true
  , (frame) ->
    if leapLoopClock > 0
      leapLoopClock--
      return
    if frame.valid and frame.gestures.length > 0
      gesture = frame.gestures[frame.gestures.length-1]
      switch gesture.type
        when 'circle'
          cmd.esc()
          leapLoopClock = CD_TIMER
          break
        # when 'keyTap'
        #   cmd.enter()
        #   leapLoopClock = CD_TIMER
        #   break
        # when 'screenTap'
        #   console.log 'Screen Tap Gesture'
        #   break
        when 'swipe'
          d_0 = Math.abs(gesture.direction[0])
          d_1 = Math.abs(gesture.direction[1])

          isHorizontal = d_0 > d_1
          #Classify as right-left or up-down
          if isHorizontal
            if gesture.direction[0] > 0
              swipeDirection = 'right'
              cmd.prev()
            else
              swipeDirection = 'left'
              cmd.next()            
          else
            #vertical
            if gesture.direction[1] > 0
              swipeDirection = 'up'
              cmd.esc()
            else
              swipeDirection = 'down'
              cmd.enter()
          console.log 'Swipe Gesture', swipeDirection
          leapLoopClock = CD_TIMER
          break
    return
  
  
  # start
  init()
  
  # swapper
 
  invl_id = window.setInterval (e)->
    swappers = $('#swapper > *')
    if swappers.length <= 0
      return
    $('#swapper').append(swappers[0])

  , 3000
  
  # loading
  loading_id = window.setTimeout (e)->
    $('#loader').addClass('hide')
    window.clearTimeout(loading_id)
  , 1200
  