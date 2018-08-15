<section id="{{page.slug}}" class="segment">
  <div class="container">
    <header>
      <h2>{{page.title || _('Title')}}</h2>
      <h4 class="lead">{{page.description}}</h4>
    </header>
    <div class="row">

      <div class="col-lg-3 col-md-6 text-center"
           ng-repeat="item in page.series">
        <div class="p-3 active-item {{item.class}}"
             data-effect="mfp-move-horizontal mfp-fullscreen">
          <figure class="w-50 py-4 m-auto">
            <img class="icon"
                 ref="icon"
                 ng-src="{{g.trans_img}}"
                 style="{{item.src|bg_img}}"
                 alt="{{item.title}}" />
          </figure>
          <h5 class="text-nowrap title"
              ref="title">
            {{item.title || '&nbsp;'}}
          </h5>
          <p class="text-nowrap subtitle"
             ref="subtitle">
            {{item.subtitle || '&nbsp;'}}
          </p>
          <p class="text-clamp-3"
             ref="caption">
            {{item.caption}}
          </p>
        </div>
      </div>

    </div>
  </div>
</section>