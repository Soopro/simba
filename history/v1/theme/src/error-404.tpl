{% include "_common_.tpl" %}

<div>
  <!-- Pages -->
  <div id="pages">
    <!-- 404 -->
    <section class="error-404 {{meta.bg.class}}">
      <div sup-widget-bg ng-model="meta.bg"></div>
      <div layout="column"
           layout-align="center center"
           style="{{meta.bg.style}}">
        <div id="logo">
          <img ng-if="site_meta.logo"
               ng-src="{{site_meta.logo}}"
               alt="{{site_meta.title}}"/>
          <svg ng-if="!site_meta.logo"
               svg-sprite="base:ico-logo"></svg>
        </div>
        <article class="text-center">
          <header>
            <h2 sup-widget-text
                default="{{_('Error 404')}}"
                ng-model="meta.title"></h2>
          </header>
          <div sup-angular-wysiwyg
               default="{{_('$_ERROR404')}}"
               ng-model="content"></div>
        </article>
        <div class="goback">
          <a href="#">{{_('Go Back')}}</a>
        </div>
        <div id="copyright">
          <span ng-bind-html="site_meta.copyright"></div>
        </div>
      </div>
    </section>
  </div>
  <!-- Javascripts -->
</div>
