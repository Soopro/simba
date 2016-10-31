{% include "_common_.tpl" %}
<!-- Header -->
{% include "_header_.tpl" %}

<!-- Pages -->
<div id="pages">
  <!-- Page -->
  <section class="page {{meta.bg.class}}">
    <div sup-widget-bg ng-model="meta.bg"></div>
    <div layout-gt-sm="row"
         layout-sm="column"
         layout-align="center center"
         style="{{meta.bg.style}}">
      <figure flex="40" flex-order-gt-sm="2">
        <div sup-widget-media
             ng-model="meta.featured_img">
          <img ng-src="{{meta.featured_img.src || g.default_img_360x360 }}"
               class="{{meta.featured_img.class || ''}}" />
        </div>
      </figure>
      <article flex="40" class="text-right">
        <header>
          <h2 sup-widget-text
              default="{{_('Tagline')}}"
              ng-model="meta.tagline"></h2>
        </header>
        <div sup-angular-wysiwyg
             default="{{_('$_CONTENT')}}"
             ng-model="content"></div>
      </article>
    </div>
  </section>
</div>
