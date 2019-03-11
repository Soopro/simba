<!-- page -->
<sup-template id="page">
  <div class="container">
    <header>
      <h2>{{page.title || _('Title')}}</h2>
      <h4 class="lead"
          ng-show="!page.attrs.hide_description">
        {{page.description}}
      </h4>
    </header>
    <div class="m-auto text-center">
      <div class="content"
           sup-bind-html="page.content"></div>
    </div>
  </div>
</sup-template>


<!-- articles -->
<sup-template id="articles">
  <div class="container"
       sup-query='post'
       perpage='1'
       ng-model="query.posts">
    <div class="carousel text-carousel slide"
         ng-if="query.posts.contents.length">
      <ol class="carousel-indicators">
        <li class="{{$first ? 'active' : ''}}"
            ng-repeat="x in [1,2,3]"></li>
        <li class="more">
          <a href="#"
             aria-label="_('More')"></a>
        </li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active"
             ng-repeat="post in query.posts.contents">
          <header>
            <h2 class="text-truncate">{{post.title || _('Title')}}</h2>
            <h4 class="lead text-truncate">{{post.description}}</h4>
          </header>
          <div class="m-auto pb-1 text-center">
            <p class="excerpt text-clamp-3">{{post.excerpt}}</p>
            <a class="mt-2 btn btn-sm btn-link"
               href="#">{{_('Read Detail')}}</a>
          </div>
        </div>
      </div>
    </div>
    <p class="text-center text-muted"
       ng-if="!query.posts.contents.length">
      {{_('There is no post yet.')}}
    </p>
  </div>
</sup-template>


<!-- features -->
<sup-template id="features">
  <div class="container">
    <header>
      <h2>{{page.title || _('Title')}}</h2>
      <h4 class="lead">{{page.description}}</h4>
    </header>

    <div class="row">
      <div class="col-lg-3 col-md-6"
           ng-repeat="item in page.series">
        <div class="p-3 text-center {{item.class}}">
          <figure class="w-50 py-1 m-auto">
            <img class="rounded-circle thumbnail"
                 ng-src="{{g.trans}}"
                 style="{{item.src|bg_img}}" />
          </figure>
          <h5 class="text-truncate title">
            {{item.title || _('Feature Title')}}
          </h5>
          <p class="text-clamp-4">
            {{item.caption || _('Description text here')}}
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
        <div class="p-3 card trigger border-0 text-center {{item.class}}">
          <figure class="m-auto">
            <img class="avatar"
                 ng-src="{{g.trans}}"
                 style="{{item.src|bg_img}}" />
          </figure>
          <div class="card-body">
            <h5 class="text-truncate card-title">
              {{item.title || _('Service Title')}}
            </h5>
            <p class="text-clamp-4 card-text">
              {{item.caption || _('Description text here')}}
            </p>
            <a class="btn btn-sm btn-link text-secondary"
               ng-if="item.link"
               href="#">{{_('Learn More')}}</a>
          </div>
        </div>
      </div>
    </div>

  </div>
</sup-template>
