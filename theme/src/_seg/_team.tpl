<section id="{{page.slug}}" class="segment">
  <div class="container">
    <header>
      <h2>{{page.title || _('Title')}}</h2>
      <h4 class="lead">{{page.description}}</h4>
    </header>
    <div class="text-center">
      <div class="content"
           sup-bind-html="page.content">
      </div>
    </div>
    <div class="row">

      <div class="col-lg-3 col-md-6"
           ng-repeat="item in page.series">
        <div class="px-4">
          <figure class="w-75 py-3">
            <img class="avatar"
                 ng-src="{{g.trans_img}}"
                 style="{{item.src|bg_img}}"
                 alt="{{item.title}}" />
          </figure>
          <h5 class="text-nowrap title">
            {{item.title || '&nbsp;'}}
          </h5>
          <p class="text-nowrap subtitle text-uppercase">
            {{item.subtitle || '&nbsp;'}}
          </p>
          <div sup-bind-html="item.extra"></div>
        </div>
      </div>

    </div>
  </div>
</section>
