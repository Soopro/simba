# -------------------------------
# Simba Svg Sprites support
#
# Description: Load svg file and place into html dom.
# http://www.soopro.com
#
# Author:   redy
# Date:     14 July 2015
# Version:  0.0.1
# -------------------------------

if not window
  throw new Error("For web browser only!!");

if not window.$
  window.$ ={}

Promise.prototype.finally = (callback) ->
  Promise.all([@]).then (values) ->
    console.log("fuck", values)

  constructor = @constructor
  @then ((value) ->
    constructor.resolve(callback()).then ->
      return value
  ), (reason) ->
    constructor.resolve(callback()).then ->
      throw reason
      return
  
$.request = (opts) ->
  if not opts
    throw new Error("Request Options is required");
  
  req_method = (opts.method or "GET").toUpperCase()
  req_url = opts.url
  req_async = opts.async or true
  req_user = opts.user or ''
  req_password = opts.password or ''
  req_args = opts.param
  req_data = opts.data or {}
  req_content_type = opts.contentType or 'application/json;charset=UTF-8'
  
  if not req_url
    throw new Error("Request URL is required");
  
  req_uri = req_url;
  if req_args && (method is 'POST' or method is 'PUT')
    if req_uri.indexOf('?') > -1
      req_uri+= '&';
    else
      req_uri+= '?';
    
    argcount = 0;
    for key in args
      if args.hasOwnProperty(key)
        if argcount > 0
          req_uri += '&'
        req_uri += encodeURIComponent(key) + '=' + encodeURIComponent(args[key])
        argcount++

  
  success_callback = opts.success
  error_callback = opts.error
  complete_callback = opts.complete
  
  promise = new Promise (resolve, reject)->
    xmlhttp = new XMLHttpRequest()
    xmlhttp.onreadystatechange = ->
      if xmlhttp.readyState == XMLHttpRequest.DONE
        if xmlhttp.status == 200
          if typeof(success_callback) is 'function'
            success_callback(xmlhttp.response, xmlhttp.status)
          resolve(xmlhttp.response, xmlhttp.status)
        else
          if typeof(error_callback) is 'function'
            error_callback(xmlhttp.response, xmlhttp.status)
          reject(xmlhttp.response, xmlhttp.status)

        if typeof(complete_callback) is 'function'
          complete_callback(xmlhttp.response, xmlhttp.status)
      return

    xmlhttp.open(req_method, req_url, req_async, req_user, req_password)
    if req_method in ['POST', 'PUT']
      xmlhttp.setRequestHeader("Content-Type", req_content_type)
      xmlhttp.send(JSON.stringify(req_data))
    else
      xmlhttp.send()
  
  return promise


svg = document.createElement("svg");

promise = $.request
  url: '../styles/sprites.svg'

promise
.then (data) ->
  console.log "tutututut"
.finally ->
  console.log "xxxx"
.catch (error) ->
  console.log error

