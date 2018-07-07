<section id="{{page.slug}}" class="segment-wrapper no-padding no-border">

  <div class="container-fluid">
    <div class="row no-gutter">

      <div class="col-md-4 col-sm-6"
           ng-repeat="item in page.series">
        <a href="#" class="portfolio-box">
          <img ng-src="{{theme_url}}/styles/trans.png"
               class="img-responsive thumbnail-img"
               style="{{item.src|bg_img}}">
          <div class="portfolio-box-caption">
            <div class="portfolio-box-caption-content">
              <div class="project-name text-nowrap">
                {{item.title}}
              </div>
              <div class="project-caption caption">
                {{item.caption}}
              </div>
            </div>
          </div>
        </a>
      </div>

    </div>
  </div>
</section>
