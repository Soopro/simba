{% include "_tpl_common_.tpl" %}
<!-- Header -->
{% include "_tpl_header_.tpl" %}
<!-- Pages -->
<div id="pages">
  <!-- Cover -->
  <section class="cover {{meta.background.class}}" sup-editor-widget-bg
   ng-model="meta.background">
    <div layout="column" layout-align="center center"
     ng-style="{'background-image': meta.background.src ?
     'url('+meta.background.src+')':'initial'}">
      <article class="text-center">
        <header>
          <h1>
            <div default="{{_('Tagline')}}"
             sup-editor-meta ng-model="meta.tagline"></div>
            <div id="swapper" sup-editor-widget-script
             ng-init="meta.swapper = setdefault(meta.swapper, 
                      '<b>'+_('Swap Text')+'</b>')"
             ng-model="meta.swapper" 
             ng-bind-html="meta.swapper">
            </div>
          </h1>
        </header>
        <div class="actions">
          <a href="#" sup-editor-widget-button ng-model="meta.login">
            {{meta.login.title || _('Button Text') }}
          </a>
          <span>&nbsp;&nbsp;/&nbsp;&nbsp;</span>
          <a href="#" sup-editor-widget-button ng-model="meta.register">
            {{meta.register.title || _('Button Text') }}
          </a>
        </div>
      </article>
    </div>
  </section>
</div>