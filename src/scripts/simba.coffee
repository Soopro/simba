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
  svgSet.load('../styles/sprites.svg', 'base')
  svgSet.render()
  
  duplicateElements()
  
  viewStatus = 0
  
  # header
  PrimaryHeader = ->
    self = @
    
    @menu = (type)->
      svg = $('#menu').find('svg')
      logo = $('#logo').find('svg')
      if viewStatus isnt 0
        viewStatus = 0
        new_sprite = svg.data('last')
        svg.data('last', '')
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
      detail.removeClass('hide')
    
    @hide = ->
      detail.addClass('hide')
      
    @toggle = ->
      if detail.hasClass('hide')
        self.show()
      else
        self.hide()

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
      slide_room.append(elements)
      
      $(elements[0]).addClass('current')
      slideIndex = 0
      totalSlides = elements.length
      self.resize()
      slider.removeClass('hide')
      window.addEventListener 'resize', self.resize
    
    @hide = ->
      slide_room.children().remove()
      slider.addClass('hide')
      window.removeEventListener 'resize', self.resize
      
    @toggle = ->
      if slider.hasClass('hide')
        self.show()
      else
        self.hide()

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
      self.isHide = true
      btn_next.addClass('hide')
      btn_prev.addClass('hide')

    @show = ->
      self.isHide = false
      if currPageIndex > 0
        btn_prev.removeClass('hide')
      else
        btn_prev.addClass('hide')
      if currPageIndex < totalPages-1
        btn_next.removeClass('hide')
      else
        btn_next.addClass('hide')
      
      if currPage.attr('dark') isnt null and not self.isHide 
        ctrl.addClass('dark')
      else
        ctrl.removeClass('dark')
        
    @next = ->
      if currPageIndex >= totalPages-1
        return
      page_slide(currPageIndex+=1)
      self.show()
      
    @prev = ->
      if currPageIndex <= 0
        return
      page_slide(currPageIndex-=1)
      self.show()
      
    @toggle = ->
      if self.isHide
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
    for page in pages
      idx = pages.indexOf(page)
      if idx == curr
        currPage = $(page)
      pos_left = 100*(idx-curr)
      $(page).css
        left: pos_left+'%'
    headerCtrl.show()
  
  
  headerCtrl = new PrimaryHeader()
  paginatorCtrl = new Paginator()
  detailCtrl = new Detail()
  sliderCtrl = new Slider()
  
  # hanlders
  # ---------------------------------->

  # buttons
  $('#menu').on 'click', (e)->
    headerCtrl.menu('close')

    $('#pages').toggleClass('zoom').removeClass('out')
    detailCtrl.hide()
    sliderCtrl.hide()
    
    if viewStatus is 1
      $('#footer').removeClass('hide')
    else
      $('#footer').addClass('hide')

    paginatorCtrl.toggle()
    headerCtrl.show()
    return
  
  $('.detail').on 'click', (e)->
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
  
  $('.btn-slider').on 'click', (e)->
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
  
  # start
  page_slide()
  