{% import 'g.tpl' %}
{% include '_css.tpl' %}

<section id="{{page.slug}}" class="segment">
  <div class="container">
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
    <div class="row"
         sup-widget-series
         default="{{[
            {
              'title': _('Service Title'),
              'subtitle': _('Price here'),
              'caption': _('Click here to edit the service.'),
              'src': theme_url+'/assets/s1.png'
            },
            {
              'title': _('Service Title'),
              'subtitle': _('Price here'),
              'caption': _('Click here to edit the service.'),
              'src': theme_url+'/assets/s2.png'
            },
            {
              'title': _('Service Title'),
              'subtitle': _('Price here'),
              'caption': _('Click here to edit the service.'),
              'src': theme_url+'/assets/s3.png'
            }
         ]}}"
         allow-fields="link"
         ng-model="meta.series">

      <div class="col-lg-3 col-md-6 mb-3"
           ng-repeat="item in meta.series">
        <div class="p-3 card border-0 text-center {{item.class}}"
             outline-inside
             series-item>
          <figure class="m-auto">
            <img class="avatar"
                 ng-src="{{g.trans}}"
                 style="{{item.src|bg_img}}"/>
          </figure>
          <div class="card-body">
            <h5 class="text-truncate card-title">
              {{item.title || '&nbsp;'}}
            </h5>
            <p class="text-clamp-4 card-text">
              {{item.caption || '&nbsp;'}}
            </p>
            <a class="btn btn-sm btn-link text-secondary"
               ng-if="item.link"
               href="#">{{_('Learn More')}}</a>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-3">
        <div class="p-3 card border-0 text-center"
             outline-inside
             series-item-create>
          <figure class="m-auto">
            <img class="avatar"
                 ng-src="{{g.trans}}"
                 style="{{theme_url+'/assets/add_service.png'|bg_img}}" />
          </figure>
          <div class="card-body">
            <h5 class="text-truncate card-title">
              {{_('Create New Service')}}
            </h5>
            <p class="text-clamp-4 card-text">
              {{_('Click here to add new one.')}}
            </p>
            <a class="btn btn-sm btn-link text-secondary"
               href="#">{{_('Create')}}</a>
          </div>
        </div>
      </div>

    </div>
  </div>
</section>
