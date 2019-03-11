{% import 'g.tpl' %}
{% include '_css.tpl' %}
<sup-body class="wrapper-body"></sup-body>

<header class="fixed-top">
  <nav class="navbar navbar-expand-lg affix">
    <div class="container-fluid">
      <a class="navbar-brand"
         href="#">
        {{site_meta.title}}
      </a>
      <div>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link"
               href="#">
              <svg width="24" height="24" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"/><path d="M21 11H6.83l3.58-3.59L9 6l-6 6 6 6 1.41-1.41L6.83 13H21z"/></svg>
              <span>{{_('Back to articles')}}</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</header>

<div class="wrapper">
  <div class="container p-5">
    <div class="row">
      <!-- col article -->
      <div class="col-md-7 mb-5">
        <article>
          <header>
            <h2>
              <span sup-widget-text
                    default="{{_('Title')}}"
                    ng-model="meta.title"></span>
            </h2>
            <h4 class="lead">
              <span sup-widget-text
                    default="{{_('Description text here')}}"
                    ng-model="meta.description"></span>
            </h4>
            <h6 class="text-secondary">{{meta.date|date_formatted}}</h6>
          </header>
          <figure sup-widget-media
                  ng-model="meta.featured_img">
            <img ng-src="{{meta.featured_img.src || g.default_img}}" />
          </figure>
          <hr>
          <div class="content"
               sup-angular-wysiwyg
               default="{{_('$_CONTENT')}}"
               text-styles="[
                 {'class': 'text-primary', 'name': _('Primary Text'),
                  'colorize': '#78909b'},
                 {'class': 'text-secondary', 'name': _('Secondary Text'),
                  'colorize': '#6b9e56'},
                 {'class': 'text-danger', 'name': _('Danger Text'),
                  'colorize': '#ff4136'}
               ]"
               ng-model="content"></div>
        </article>
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
