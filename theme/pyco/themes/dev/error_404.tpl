<!-- CSS -->
<link href="{{theme_url}}libs/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="{{theme_url}}css/styles.css" rel="stylesheet">
<link href="{{theme_url}}css/editor_styles.css" rel="stylesheet">
<!-- Page -->
<div id="wrapper">
  <!-- Header -->
  <header class="pirmary-header home">
    <div id="logo" ng-if="!site_meta.logo">{{site_meta.title}}</div>
    <div id="logo" ng-if="site_meta.title" 
    style="background-image:url({{site_meta.logo}})">
      {{site_meta.title}}
    </div>
  </header>
  <!-- Content -->
  <article class="container text-center page">
    <h1 sup-editor-meta ng-model="meta.title"></h1>
    <div sup-angular-wysiwyg ng-model="content"></div>
  </article>
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
