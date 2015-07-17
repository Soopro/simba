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

$(document).ready ->
  svgSet = new svgSprites()
  svgSet.load('../styles/sprites.svg', 'base')
  svgSet.render()
  
  $('#header').addClass('light')
  
  $('#menu').on 'click', (e)->
    $('#pages').toggleClass('zoom')
    $('#header').toggleClass('light')
    $('#footer').toggleClass('show')
  
  
  pages = $('#pages > section')
  for page in pages
    idx = pages.indexOf(page)
    pos_left = 100*idx+idx
    $(page).css
      left: pos_left+'%'
  