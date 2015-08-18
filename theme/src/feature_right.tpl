{% include "_tpl_common_.tpl" %}
<!-- Header -->
{% include "_tpl_header_.tpl" %}

<!-- Pages -->
<div id="pages">
  <!-- Page -->
  <section class="page {{meta.background.class}}" title="{{meta.title}}">
    <div layout-gt-sm="row" layout-sm="column" layout-align="center center"
     ng-style="{'background-image': meta.background.src ?
     'url('+meta.background.src+')':'initial'}" 
     sup-editor-widget-bg ng-model="meta.background" sup-is-wide>
      <figure flex="40" flex-order-gt-sm="2">
        <img sup-editor-media ng-model="meta.featured_img"
         ng-src="{{meta.featured_img.src || g.default_img_360x360 }}"
         alt="{{meta.featured_img.title}}" 
         class="{{meta.featured_img.class || ''}}" />
      </figure>
      <article flex="40" class="text-right" stop-hit>
        <header>
          <h2 sup-editor-meta ng-model="meta.tagline">{{_('Tagline')}}</h2>
        </header>
        <div ng-init="content = content ? content : _('$_CONTENT')"
         sup-angular-wysiwyg ng-model="content"></div>
      </article>
    </div>
  </section>
</div>
