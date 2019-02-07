<!-- page -->
<sup-template id="page">
  <div class="container">
    <header>
      <h2>{{page.title || _('Title')}}</h2>
      <h4 class="lead">{{page.description}}</h4>
    </header>
    <div class="m-auto text-center">
      <div class="content"
           sup-bind-html="page.content"></div>
  </div>
</sup-template>


<!-- features -->
<sup-template id="features">
  <div class="container">
    <header>
      <h2>{{page.description || _('Title')}}</h2>
      <h4 class="lead">{{page.description}}</h4>
    </header>

    <div class="row">
      <div class="col-lg-3 col-md-6"
           ng-repeat="item in page.series">
        <div class="p-3 text-center {{item.class}}">
          <figure class="w-50 py-1 m-auto">
            <img class="rounded-circle thumbnail"
                 ng-src="{{g.trans}}"
                 style="{{item.src|bg_img}}"
                 alt="{{item.title}}" />
          </figure>
          <h5 class="text-truncate title">
            {{item.title || '&nbsp;'}}
          </h5>
          <p class="text-clamp-4">
            {{item.caption || '&nbsp;'}}
          </p>
        </div>
      </div>
    </div>

  </div>
</sup-template>


<!-- services -->
<sup-template id="services">
  <div class="container">
    <header>
      <h2>{{page.title || _('Title')}}</h2>
      <h4 class="lead">{{page.description}}</h4>
    </header>

    <div class="row">
      <div class="col-lg-3 col-md-6 mb-3"
           ng-repeat="item in page.series">
        <div class="p-3 card border-0 text-center {{item.class}}">
          <figure class="m-auto">
            <img class="avatar"
                 src="{{g.trans}}"
                 style="{{item.src|bg_img}}" />
          </figure>
          <div class="card-body">
            <h5 class="text-truncate card-title">
              {{item.title || '&nbsp;'}}
            </h5>
            <p class="text-clamp-4 card-text">>
              {{item.caption || '&nbsp;'}}
            </p>
            <a class="btn btn-sm btn-link text-secondary"
               href="#">{{_('Read More')}}</a>
          </div>
        </div>
      </div>
    </div>

  </div>
</sup-template>