{% include "_common_.tpl" %}
<!-- Header -->
{% include "_header_.tpl" %}
<!-- Pages -->
<div id="pages">
  <!-- Cover -->
  <section class="cover {{meta.background.class}}" sup-widget-bg
   ng-model="meta.background">
    <div layout="column" layout-align="center center"
     style="{{meta.background.style}}">
      <article class="text-center">
        <header>
          <h1>
            <div default="{{_('Tagline')}}"
             sup-widget-text ng-model="meta.tagline"></div>
            <div swapper sup-widget-collect ng-model="meta.swapper"
             default="[{'name':'0', 'value':_('Swap Text')}]">
               <b ng-repeat="item in meta.swapper">{{item.value}}</b>
            </div>
          </h1>
        </header>
        <div class="actions">
          <a href="#" sup-widget-button ng-model="meta.login">
            {{meta.login.name || _('Button Text') }}
          </a>
          <span>&nbsp;&nbsp;/&nbsp;&nbsp;</span>
          <a href="#" sup-widget-button ng-model="meta.register">
            {{meta.register.name || _('Button Text') }}
          </a>
        </div>
      </article>
    </div>
  </section>
</div>