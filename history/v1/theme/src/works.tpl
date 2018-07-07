{% include "_common_.tpl" %}
<!-- Slide -->
<div id="slider" class="open dark" layout="row" layout-align="center center">
  <header>
    <h3 class='title'
        sup-widget-text
        default="{{_('Title')}}"
        ng-model="meta.title"></h3>
  </header>
  <button type="button" class="btn-prev">
    <svg svg-sprite="base:ico-arr_left"></svg>
  </button>
  <div class="slider-inner"
       layout="column"
       layout-align="center center"
       flex>
    <div class="slides"
         sup-widget-carousel
         ng-model="meta.gallery">
      <img class="current"
           ng-src="{{meta.gallery[0].src || g.default_img_360x360}}"/>
    </div>
  </div>
  <button type="button"
          class="btn-next">
    <svg type="button"
         svg-sprite="base:ico-arr_right"></svg>
  </button>
</div>