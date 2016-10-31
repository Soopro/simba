<header id="header" class="{{meta.bg.class}}"
 layout="row" layout-align="space-between center">
  <div id="logo">
    <img ng-if="site_meta.logo" ng-src="{{site_meta.logo}}"
     alt="{{site_meta.title}}"/>
    <svg ng-if="!site_meta.logo" svg-sprite="base:ico-logo"></svg>
  </div>
  <button type="button" id="menu">
    <svg class="btn-menu" svg-sprite="base:ico-menu"></svg>
  </button>
</header>