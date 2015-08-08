<!-- CSS -->
<link href="{{theme_url}}libs/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="{{theme_url}}css/styles.css" rel="stylesheet">
<link href="{{theme_url}}css/editor_styles.css" rel="stylesheet">
<!-- Page -->
<div id="wrapper">
  <!-- Header -->
  <header class="pirmary-header">
    <nav class="pirmary-nav">
        <div class="brand">
          <a id="logo-s" class="brand" href="＃">{{site_meta.title}}</a>
        </div>
        <a href="#" class="nav-toggle">Toggle</a>
        <div class="collapse" id="mainnav">
          <ul class="navlist">
            <li ng-repeat="item in menu['primary']"
            ng-class="{'active': (item.url|path) == (meta.url|path)}">
              <a class="btn-nav {{item.meta.class}}" ng-class="{'btn-nav-home':item.alias == 'home'}">
                {{item.title}}
              </a>
            </li>
          </ul>
        </div>
    </nav>
  </header>
  <!-- Main -->
  <div sup-editor-content-query fields="{type:'_feature'}" results="features">
    <div ng-repeat="feature in query.features" ng-switch="feature.template" class="repeat-features">
      <section class="feature" ng-switch-when="feature">
        <div sup-editor-open sup-is-wide file="feature" class="container">
          <header>
            <h2 ng-bind-html="feature.title"></h2>
          </header>
          <div class="feature-content">
            <div class="feature-img">
              <img ng-src="{{feature.featured_img.src || theme_url+'imgs/default_600x300.png'}}" alt="{{feature.title}}">
            </div>
            <div class="feature-text" ng-bind-html="feature.content"></div>
          </div>
        </div>
      </section>
      <section class="feature col2-feature" ng-switch-when="feature_2col">
        <div sup-editor-open sup-is-wide file="feature" class="container">
          <header>
            <h2 ng-bind-html="feature.title"></h2>
          </header>
          <div class="feature-content clearfix">
            <div class="feature-text" ng-bind-html="feature.content"></div>
            <div class="feature-img">
              <img ng-src="{{feature.featured_img.src || theme_url+'imgs/default_600x300.png'}}" alt="{{feature.title}}">
            </div>
          </div>
        </div>
      </section>
      <section class="feature" ng-switch-when="feature_top_text">
        <div sup-editor-open sup-is-wide file="feature" class="container">
          <header>
            <h2 ng-bind-html="feature.title"></h2>
          </header>
          <div class="feature-content">
            <div class="feature-text" ng-bind-html="feature.content"></div>
            <div class="feature-img">
              <img ng-src="{{feature.featured_img.src || theme_url+'imgs/default_600x300.png'}}" alt="{{feature.title}}">
            </div>
          </div>
        </div>
      </section>
    </div>
  </div>
  <!-- Register -->
  <section class="container register" ng-if="site_meta.register">
    <div class="input-group">
      <input type="email" id ="input-register" class="form-control input-lg" 
      placeholder="{{site_meta.register.text}}" />
      <span class="input-group-btn">
        <button class="btn input-lg btn-primary register-btn">
          {{site_meta.register.title}}
        </button>
      </span>
    </div>
    <p class="text-center" ng-if="site_meta.login">
      <span ng-bind-html="site_meta.login.text"></span>
      <a href="#">{{site_meta.login.title}}</a>
    </p>
  </section>
</div>
<!-- Footer -->
<footer class="pirmary-footer">
  <div id="copyright">
    <span ng-bind-html="site_meta.copyright"></span>
    <a href="#" class="footer-link" 
    ng-repeat="item in menu['doc']"
    ng-class="{'active': (item.url|path) == (meta.url|path)}">
      {{item.title}}
    </a>
    <!-- Language -->
    <div class="languages" ng-if="site_meta.translates">
      <a href="#" class="bullet"
      ng-repeat="(code, trans) in site_meta.translates"
      ng-class="{'active':code.indexOf(lang)>-1}">
        {{trans.name}}
      </a>
    </div>
  </div>
</footer>