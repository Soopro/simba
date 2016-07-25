{% include "_common_.tpl" %}
<!-- Slide -->
<div id="slider" class="open dark" layout="row" layout-align="center center">
  <header>
    <h3 class='title' default="{{_('Title')}}"
     sup-widget-text ng-model="meta.title"></h3>
  </header>
  <button type="button" class="btn-prev">
    <svg svg-sprite="base:ico-arr_left"></svg>
  </button>
  <div class="slider-inner" flex layout="column" layout-align="center center">
    <div class="slides" sup-widget-gallery  sup-primary="bottom right"
     ng-model="meta.gallery">
      <img class="current" 
       ng-src="{{meta.gallery[0].src || g.default_img_360x360}}"/>
    </div>
  </div>
  <button type="button" class="btn-next">
    <svg type="button" svg-sprite="base:ico-arr_right"></svg>
  </button>
</div>