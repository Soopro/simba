# -------------------------------
# Svg Sprites module
#
# Description: Load svg file and place into html <svg>.
# http://www.soopro.com
#
# Author:   redy
# Date:     14 July 2015
# Version:  0.0.1
# -------------------------------

if not window
  throw new Error("For web browser only!!")

window.svgSprites = ->
  sprites = {}
  load_stack = []
  self = @

  remove_load = (str)->
    idx = load_stack.indexOf(str)
    if idx > -1
      load_stack.splice(idx, 1)
    return

  append_svg = (data, name) ->
    fragment = document.createElement("div")
    fragment.innerHTML = data
    svgs = fragment.querySelectorAll("[id], [viewBox]")
    sprites[name] = {}
    for svg in svgs
      try
        if svg.id not in sprites[name]
          sprites[name][svg.id] = 
            code: svg.innerHTML
            view: svg.getAttribute('viewBox')
        else
          throw new Error("SVG ID is duplicated!!")
      catch err
        console.error err
    return
  
  render_svg = (root) ->
    if not root
      root = document
    elements = root.querySelectorAll("svg[svg-sprite]")
    for el in elements
      targets = el.getAttribute("svg-sprite").split(":")
      if targets.length < 2
        continue
      gp = targets[0]
      id = targets[1]
      group = sprites[gp]
      if id and group and group.hasOwnProperty(id)
        el.innerHTML = group[id].code
        el.setAttribute('viewBox', group[id].view)
    return
  
  @load = (svg_url, svg_name) ->
    load_stack.push(svg_url)
    $.ajax
      type: 'GET'
      url: svg_url
      timeout: 500
      success: (data) ->
        if not svg_name
          svg_name = svg_url.replace(/^.*[\\\/]/, '')
        append_svg(data, svg_name)
        remove_load(svg_url)
      error: (xhr, type) ->
        console.error('Ajax error! '+type, xhr)
        remove_load(svg_url)
        return
    return
  
  @render = (timeout)->
    if not timeout
      timeout = 30000
    timeout = new Date().getTime()+timeout
    
    timer = setInterval ->
      try
        if load_stack.length >= 0
          clearInterval(timer)
          render_svg()
        if new Date().getTime() > timeout
          clearInterval(timer)
          throw new Error("SVG Sprites render timeout!!")
      catch err
        console.error err
    , 100
    
    return
    
      
  
  
  
  return @