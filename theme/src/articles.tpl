{% import 'g.tpl' %}
{% include '_css.tpl' %}
<style>
  body {
    height: auto;
    min-height: 100%;
  }
</style>
<div class="wrapper">
  <div class="container p-5">
    <header>
      <h1>
        <span sup-widget-text
              default="{{_('Articles')}}"
              ng-model="meta.title"></span>
      </h1>
    </header>
    <hr>
    <div class="row">
      <!-- col entries -->
      <div class="col-md-7 mb-5"
           sup-query='post'
           ng-model="query.booklet">
        <div class="py-2"
             ng-repeat="post in query.booklet.contents">
          <header>
            <h3>{{post.title || _('Title')}}</h3>
            <h5 class="lead">{{post.date|date_formatted}}</h5>
          </header>
          <figure ng-if="post.featured_img.src">
            <img ng-src="{{post.featured_img.src}}" />
          </figure>
          <p class="excerpt text-clamp-4">{{post.excerpt}}</p>
          <a class="mt-2 btn btn-sm btn-secondary"
             href="{{post.url}}">{{_('Read Detail')}}</a>
        </div>
        <div class="py-2"
             ng-if="!query.booklet.contents.length">
          <p class="text-center text-muted">
            {{_('There is no post yet.')}}
          </p>
        </div>
        <hr>
        <nav aria-label="{{_('Pagination')}}"
             ng-if="booklet.total_pages > 1">
          <ul class="pagination">
            <li class="page-item disabled">
              <a class="page-link"
                 href="#"
                 aria-label="{{_('Previous Page')}}">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
            <li class="page-item {{$first ? 'active' : ''}}"
                ng-repeat="p in query.booklet.page_range">
              <a class="page-link"
                 href="#">
               {{p}}
              </a>
            </li>
            <li class="page-item {{query.booklet.has_next ? '':'disabled'}}">
              <a class="page-link"
                 href="#"
                 aria-label="{{_('Next Page')}}">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
        </nav>
      </div>

      <!-- col aside -->
      <div class="col-md-4 ml-auto"
           sup-categorize
           ng-model="category">
        <h6>{{_(category.name || 'Categories')}}</h6>
        <div class="list-group list-group-flush">
          <a class="list-group-item list-group-item-action
                    {{!meta.terms.length ? 'active' : ''}}"
             href="#">{{_('All')}}</a>
          <a class="list-group-item list-group-item-action
                    {{meta.terms.indexOf(term.key) > -1 ? 'active' : ''}}"
             ng-repeat="term in category.terms"
             href="#">
            {{term.meta.name}}
          </a>
        </div>
      </div>

    </div>
  </div>
</div>

{% include '_footer.tpl' %}
