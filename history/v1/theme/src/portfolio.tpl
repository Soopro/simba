{% include "_common_.tpl" %}
<!-- Header -->
{% include "_header_.tpl" %}
<!-- Pages -->
<div id="pages">
  <!-- Cover -->
  <section class="portfolio {{meta.bg.class}}">
    <div sup-widget-bg ng-model="meta.bg"></div>
    <div layout="column"
         layout-align="center center"
         style="{{meta.bg.style}}">
      <header>
        <h2 sup-widget-text
            default="{{_('Title')}}"
            ng-model="meta.title"></h2>
      </header>
      <div class="portfolio-inner"
           sup-query='works'
           perpage="12"
           ng-model="query.works">
        <figure class="btn open-slider"
                ng-repeat="works in query.works.contents"
                sup-widget-open
                file="works">
          <img ng-src="{{(works.featured_img.src | thumbnail) ||
                          works.gallery[0].src}}"/>
        </figure>
      </div>
    </div>
  </section>
</div>