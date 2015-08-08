<!-- CSS -->
<link href="{{theme_url}}libs/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="{{theme_url}}css/styles.css" rel="stylesheet">
<link href="{{theme_url}}css/editor_styles.css" rel="stylesheet">
<!-- Page -->
<div id="wrapper" class="theme-wrapper">
  <!-- Main -->
  <section class="container" sup-editor-widget-gallery ng-model="meta.gallery">
    <div class="theme-box" ng-if="!meta.gallery">
      <img ng-src="{{meta.featured_img.src || theme_url+'imgs/default_600x600.png'}}" title="default">
    </div>
    <div class="theme-box" ng-if="meta.gallery">
      <img ng-src="{{meta.gallery[0].src}}" title="theme">
      <div class="row">
        <div class="col-xs-6 text-left">
          {{meta.gallery[0].title}}
        </div>
        <div class="col-xs-6 text-right">
          1 / {{meta.gallery.length}}
        </div>
      </div>
    </div>
  </div>
</div>