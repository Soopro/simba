{% include "_tpl_common_.tpl" %}
<!-- Header -->
{% include "_tpl_header_.tpl" %}
<!-- Pages -->
<div id="pages">
  <!-- Cover -->
  <section class="cover {{meta.background.class}}" title="{{meta.title}}">
    <div layout="column" layout-align="center center"
     ng-style="{'background-image': meta.background.src ?
     'url('+meta.background.src+')':'initial'}" 
     sup-editor-widget-bg ng-model="meta.background" sup-is-wide>
      <article class="text-center" stop-hit>
        <header>
          <h1>
            <span sup-editor-meta
             ng-model="meta.tagline">{{_('Tagline')}}</span>
            <span id="swapper" sup-editor-widget-script
             ng-init="meta.swapper = 
             meta.swapper ? meta.swapper : '<b>'+_('Swap Text')+'</b>'"
             ng-model="meta.swapper" 
             ng-bind-html="meta.swapper">
            </span>
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