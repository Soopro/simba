{% include "_tpl_common_.tpl" %}
<!-- Header -->
{% include "_tpl_header_.tpl" %}

<!-- Pages -->
<div id="pages">
  <!-- Page -->
  <section class="contact {{meta.background.class}}" sup-editor-widget-bg
   ng-model="meta.background">
    <div layout-gt-sm="row" layout-sm="column" layout-align="center center"
     ng-style="{'background-image': meta.background.src ?
     'url('+meta.background.src+')':'initial'}">
      <article flex-gt-sm="35">
        <header>
          <h2 default="{{_('Title')}}"
           sup-editor-meta ng-model="meta.title"></h2>
        </header>
        <div default="{{_('$_CONTENT')}}"
         sup-angular-wysiwyg ng-model="content"></div>
        <div class="info">
          <p>
            <i class="ico">
              <svg svg-sprite="base:ico-email"></svg>
            </i>
            <a href="#" class="btn-primary" 
             sup-editor-widget-button ng-model="meta.email">
             {{meta.email.title || _('Email Address') }}
            </a>
          </p>
          <p>
            <i class="ico">
              <svg svg-sprite="base:ico-im"></svg>
            </i>
            <a href="#" class="btn-primary" 
             sup-editor-widget-button ng-model="meta.im">
             {{meta.im.title || _('Instant Messenger ID') }}
            </a>
          </p>
        </div>
      </article>
      <aside flex-gt-sm="35" flex-sm="45" class="text-center">
        <div sup-editor-media ng-model="meta.featured_img">
          <img ng-src="{{meta.featured_img.src || g.default_img_240x240}}"
           class="{{meta.featured_img.class || ''}}" />
        </div>
      </aside>
    </div>
  </section>
</div>
