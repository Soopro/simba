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
  svgSet.load('../styles/sprites.svg', 'base2')
  svgSet.load('../styles/sprites.svg', 'base3')
  svgSet.render()