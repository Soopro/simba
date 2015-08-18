{% include "_tpl_common_.tpl" %}
<!-- Header -->
{% include "_tpl_header_.tpl" %}
<!-- Pages -->
<div id="pages">
  <!-- Cover -->
  <section class="page {{meta.background.class}}" title="{{meta.title}}">
    <div layout-gt-sm="row" layout-sm="column" layout-align="center center"
     ng-style="{'background-image': meta.background.src ?
     'url('+meta.background.src+')':'initial'}" 
     sup-editor-widget-bg ng-model="meta.background" sup-is-wide>
      <figure flex="40">
        <img sup-editor-media ng-model="meta.featured_img"
         src="{{meta.featured_img.src || g.default_img_480x480 }}"
         alt="{{meta.featured_img.title}}" 
         class="{{meta.featured_img.class || ''}}" />
      </figure>
      <article flex="40">
        <header>
          <h2 sup-editor-meta ng-model="meta.tagline">{{_('Tagline')}}</h2>
        </header>
        <div sup-angular-wysiwyg ng-model="content">x_x</div>
      </article>
    </div>
  </section>
</div>
