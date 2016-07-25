{% include "_common_.tpl" %}
<!-- Header -->
{% include "_header_.tpl" %}

<!-- Pages -->
<div id="pages">
  <!-- Page -->
  <section class="contact {{meta.background.class}}" sup-widget-bg
   ng-model="meta.background">
    <div layout-gt-sm="row" layout-sm="column" layout-align="center center"
     style="{{meta.background.style}}">
      <article flex-gt-sm="35">
        <header>
          <h2 default="{{_('Title')}}"
           sup-widget-text ng-model="meta.title"></h2>
        </header>
        <div default="{{_('$_CONTENT')}}"
         sup-angular-wysiwyg ng-model="content"></div>
      </article>
      <aside flex-gt-sm="35" flex-sm="45" class="text-center">
        <div sup-widget-media ng-model="meta.featured_img">
          <img ng-src="{{meta.featured_img.src || g.default_img_240x240}}"
           class="{{meta.featured_img.class || ''}}"/>
        </div>
      </aside>
    </div>
  </section>
</div>
