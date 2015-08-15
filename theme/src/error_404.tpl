<div svg-sprites-loader 
 data-url="{{ site_meta.svg_sprites || theme_url+'/styles/svgdefs.svg' }}"
 data-name="base">
  <!-- Pages -->
  <div id="pages">
    <!-- 404 -->
    <section class="error-404" title="404 Error" dark>
      <div layout="column" layout-align="center center">
        <div id="logo">
          <svg svg-sprite="base:ico-logo"></svg>
        </div>
        <article class="text-center">
          <header>
            <h2>{{meta.title}}</h2>
          </header>
          {{content}}
        </article>
        <div class="goback">
          <a href="{{base_url}}">{{_('Go Back')}}</a>
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