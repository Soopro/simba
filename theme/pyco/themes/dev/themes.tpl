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
  <section class="container gallery">
    <div class="row" sup-editor-content-query fields="{type:'_theme'}" length="18" results="themes">
      <div class="col-xs-12 col-sm-4 col-md-2 thumb-box gallery-container" ng-repeat="item in query.themes">
        <a href="#" class="thumb gallery-image" sup-editor-open file="item">
          <img ng-src="{{item.featured_img.src || theme_url+'imgs/default_600x600.png'}}" class="img-responsive" alt="{{item.title}}">
        </a>
      </div>
    </div>
  </section>
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
