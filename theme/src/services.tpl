{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div class="editor-top"></div>

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
         allow-fields="subtitle, poster, extra"
         ng-model="meta.series">

      <div class="col-lg-3 col-md-6 text-center"
           ng-repeat="item in meta.series">
        <div class="p-3 active-item {{item.class}}"
             series-item>
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

      <div class="col-lg-3 col-md-6 text-center">
        <div class="p-3 active-item"
             series-item-create>
          <figure class="w-50 py-4 m-auto">
            <img class="icon bg-light"
                 ref="icon"
                 ng-src="{{g.trans_img}}"
                 style="{{theme_url+'/assets/add.png'|bg_img}}" />
          </figure>
          <h5 class="text-nowrap title"
              ref="title">
            {{_('Create New Service')}}
          </h5>
          <p class="text-nowrap subtitle"
             ref="subtitle">
            {{_('Price here')}}
          </p>
          <p class="text-clamp-3"
             ref="caption">
            {{_('Click here to add new one.')}}
          </p>
        </div>
      </div>

    </div>
  </div>
</section>
