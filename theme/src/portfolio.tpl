{% include "_tpl_common_.tpl" %}
<!-- Header -->
{% include "_tpl_header_.tpl" %}
<!-- Pages -->
<div id="pages">
  <!-- Cover -->
  <section class="portfolio {{meta.background.class}}" sup-editor-widget-bg
   ng-model="meta.background">
    <div layout="column" layout-align="center center"
     ng-style="{'background-image': meta.background.src ?
     'url('+meta.background.src+')':'initial'}">
      <header>
        <h2 ng-init="meta.title=meta.title?meta.title:_('Title')"
         sup-editor-meta ng-model="meta.title"></h2>
      </header>
      <div class="portfolio-inner" sup-editor-content-query
       fields="{type:'_works'}"
       length="{{g.perpage}}"
       sortby="{{g.sortby}}"
       ng-model="query.works">
        <figure class="btn open-slider" ng-repeat="works in query.works"
         sup-editor-open file="works">
          <img ng-src="{{(works.featured_img.src | thumbnail) ||
           works.gallery[0].src}}"/>
        </figure>
      </div>
    </div>
  </section>
</div>