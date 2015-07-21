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
  
  # header
  PrimaryHeader = ->
    self = @
    @menuStatus = 0
    
    @menu = (type)->
      console.log type
      svg = $('#menu').find('svg')
      if self.menuStatus isnt 0
        self.menuStatus = 0
        new_sprite = svg.data('last')
        svg.data('last', '')
      else
        self.menuStatus = if type is 'close' then 1 else 2
        new_sprite = svg.data(type)
        old_sprite = svg.attr('svg-sprite') or ''
        svg.data('last', old_sprite)
        console.log self.menuStatus, old_sprite

      svg.attr('svg-sprite', new_sprite)
      svgSet.render(svg)
      
    @show = ->
      if currPage.attr('dark') isnt null and self.menuStatus isnt 1
        $('#header').addClass('dark')
      else
        $('#header').removeClass('dark')
  
    return @

  # paginatorCtrl
  Paginator = ->
    self = @
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
        btn_next.addClass('dark')
        btn_prev.addClass('dark')
      else
        btn_next.removeClass('dark')
        btn_prev.removeClass('dark')
        
    @next = ->
      if currPageIndex >= totalPages-1
        return
      pageSlide(currPageIndex+=1)
      self.show()
    @prev = ->
      if currPageIndex <= 0
        return
      pageSlide(currPageIndex-=1)
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
  
  headerCtrl = new PrimaryHeader()
  paginatorCtrl = new Paginator()
  
  pageSlide = (curr)->
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

  
  # buttons
  $('#menu').on 'click', (e)->
    headerCtrl.menu('close')

    $('#pages').toggleClass('zoom').removeClass('out')
    $('#footer').toggleClass('hide')

    paginatorCtrl.toggle()
    headerCtrl.show()
    return
  
  $('.detail').on 'click', (e)->
    headerCtrl.menu('collapse')
    
    $('#pages').toggleClass('zoom').toggleClass('out')
    $('#footer').addClass('hide')

    paginatorCtrl.toggle()
    headerCtrl.show()
    return
  
  # start
  pageSlide()
  