{% include "_tpl_common_.tpl" %}
<!-- Header -->
{% include "_tpl_header_.tpl" %}

<!-- Pages -->
<div id="pages">
  <!-- Page -->
  <section class="page {{meta.background.class}}" sup-editor-widget-bg
   ng-model="meta.background">
    <div layout-gt-sm="row" layout-sm="column" layout-align="center center"
     ng-style="{'background-image': meta.background.src ?
     'url('+meta.background.src+')':'initial'}">
      <figure flex="40" flex-order-gt-sm="2">
        <div sup-editor-media ng-model="meta.featured_img">
          <img ng-src="{{meta.featured_img.src || g.default_img_360x360 }}"
           class="{{meta.featured_img.class || ''}}" />
        </div>
      </figure>
      <article flex="40" class="text-right">
        <header>
          <h2 ng-init="meta.tagline=meta.tagline?meta.tagline:_('Tagline')"
           sup-editor-meta ng-model="meta.tagline"></h2>
        </header>
        <div ng-init="content = content ? content : _('$_CONTENT')"
         sup-angular-wysiwyg ng-model="content"></div>
      </article>
    </div>
  </section>
</div>
