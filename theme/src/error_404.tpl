{% include "_common_.tpl" %}

<div>
  <!-- Pages -->
  <div id="pages">
    <!-- 404 -->
    <section class="error-404 {{meta.background.class}}"
     sup-editor-widget-bg ng-model="meta.background">
      <div layout="column" layout-align="center center"
       ng-style="{'background-image': meta.background.src ?
       'url('+meta.background.src+')':'initial'}">
        <div id="logo">
          <img ng-if="site_meta.logo" ng-src="{{site_meta.logo}}"
           alt="{{site_meta.title}}"/>
          <svg ng-if="!site_meta.logo" svg-sprite="base:ico-logo"></svg>
        </div>
        <article class="text-center">
          <header>
            <h2 default="{{_('Error 404')}}"
             sup-editor-meta ng-model="meta.title"></h2>
          </header>
          <div default="{{_('$_ERROR404')}}"
           sup-angular-wysiwyg ng-model="content"></div>
        </article>
        <div class="goback">
          <a href="#">{{_('Go Back')}}</a>
        </div>
        <div id="copyright">
          {{site_meta.copyright}}
        </div>
      </div>
    </section>
  </div>
  <!-- Javascripts -->
</div>
