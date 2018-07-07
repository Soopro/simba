<section id="{{page.slug}}" class="segment-wrapper">

  <header class="container">
    <h2 class="section-heading"
        sup-bind-html="page.title || _('Title')">
    </h2>
    <hr class="divider">
  </header>

  <div class="container">
    <div class="row">

      <div class="col-md-3 col-sm-6 text-center"
           ng-repeat="item in page.series">
        <div class="service-box">
          <figure>
            <img ng-src="{{theme_url}}/styles/trans.png"
                 class="img-responsive thumbnail-img"
                 style="{{item.src|bg_img}}" />
          </figure>
          <h3 class="text-nowrap">
            {{item.title}}
          </h3>
          <p class="text-muted text-clamp-2">
            {{item.caption}}
          </p>
        </div>
      </div>

    </div>
  </div>

</section>
