# --------------------------------
# Language Redirect
# 
# Description: Use js to redirect base on browser's language
# Author : Redy Ru
# Email : redy.ru@gmail.com
# License : 2015 MIT
# Version 0.0.1
# Usage: 
#    Put attribute 'auto-lang-redirect' on <html> tag.
#    Write a JSON String for this attribute's value with {lang code: url}.
#    lang code could be simplized. 'en_US' and 'en' both worked.
#    Also need specific a 'lang' attribute for define current language.
#    
#    Example: 
#    <html lang="en" auto-lang-redirect="{'en_US': 'http://soopro.com/en/', 
#    'zh_CN': 'http://localhost:5500/'}" >
# 
# --------------------------------

# languages
default_lang = 'en'

html_dom = document.querySelector('html')
redirect_dom = document.querySelector('[auto-lang-redirect]')

if html_dom
  htmlLang = html_dom.getAttribute('lang')
if redirect_dom
  _redirects = redirect_dom.getAttribute('auto-lang-redirect')
  try
    redirects = JSON.parse(_redirects.replace(/'/g,'"'))
  catch e
    console.log e
    redirects = null

if not htmlLang or not redirects
  return

userLang = navigator.language or navigator.userLanguage or default_lang
locale = userLang.replace('-','_')
lang = locale.split('_')[0]
  
for _lang in [userLang, locale, lang]
  if _lang == htmlLang
    redirect_to = null
    break
  else
    redirect_to = redirects[_lang]
    if redirect_to
      break

if not redirect_to
  return

current_url = location.protocol+'//'+location.host+location.pathname
safe_redirect_to = redirect_to.split('?')[0].split('#')[0]

if safe_redirect_to != current_url
  window.location.replace(redirect_to)
  return