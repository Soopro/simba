<div>
  <!-- Pages -->
  <div id="pages">
    <!-- 404 -->
    <section class="error-404 {{page.background.class}}">
      <div layout="column" layout-align="center center">
        <div id="logo">
          <img ng-if="site_meta.logo" ng-src="{{site_meta.logo}}"
           alt="{{site_meta.title}}"/>
          <svg ng-if="!site_meta.logo" svg-sprite="base:ico-logo"></svg>
        </div>
        <article class="text-center">
          <header>
            <h2 sup-editor-meta ng-model="meta.title">Error 404</h2>
          </header>
          <div sup-angular-wysiwyg ng-model="content">x_x</div>
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
{% include "_tpl_common_.tpl" %}