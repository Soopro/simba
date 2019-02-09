{% import 'g.tpl' %}
{% include '_css.tpl' %}

<div class="wrapper">
  <div class="container p-5">
    <div class="row">
      <!-- col article -->
      <div class="col-md-7 mb-5">
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
        </header>
        <figure>
          <img src="{{meta.featured_img.src}}" />
        </figure>
        <div class="m-auto text-center">
          <div class="content"
               sup-angular-wysiwyg
               default="{{_('$_CONTENT')}}"
               ng-model="content"></div>
        </div>
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
