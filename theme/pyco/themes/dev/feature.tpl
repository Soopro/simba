<!-- CSS -->
<link href="{{theme_url}}libs/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="{{theme_url}}css/styles.css" rel="stylesheet">
<link href="{{theme_url}}css/editor_styles.css" rel="stylesheet">
<!-- Page -->
<div id="wrapper" class="feature-wrapper">
  <!-- Main -->
  <section class="feature">
    <div class="container">
      <header>
        <h2 sup-editor-meta ng-model="meta.title"></h2>
      </header>
      <div class="feature-content">
        <div class="feature-img" sup-editor-media ng-model="meta.featured_img">
          <img ng-src="{{meta.featured_img.src || theme_url+'imgs/default_600x300.png'}}" alt="{{meta.title}}">
        </div>
        <div class="feature-text">
          <div sup-angular-wysiwyg ng-model="content">
            <p>
              Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque
              penatibus et magnis dis parturient montes, nascetur ridiculus mus.
            </p>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>