{% include "_common_.tpl" %}
<!-- Header -->
{% include "_header_.tpl" %}
<!-- Pages -->
<div id="pages">
  <!-- Cover -->
  <section class="portfolio {{meta.background.class}}" sup-widget-bg
   ng-model="meta.background">
    <div layout="column" layout-align="center center"
     style="{{meta.background.style}}">
      <header>
        <h2 default="{{_('Title')}}"
         sup-widget-text ng-model="meta.title"></h2>
      </header>
      <div class="portfolio-inner" sup-query='works' ng-model="query.works">
        <figure class="btn open-slider" ng-repeat="works in query.works"
         sup-widget-open file="works">
          <img ng-src="{{(works.featured_img.src | thumbnail) ||
           works.gallery[0].src}}"/>
        </figure>
      </div>
    </div>
  </section>
</div>