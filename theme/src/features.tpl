{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div class="editor-top"></div>

<section id="{{meta.slug}}" class="segment">
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
              'title': _('Feature Title'),
              'caption': _('Click here to edit the feature.'),
              'src': theme_url+'/assets/f1.png'
            },
            {
              'title': _('Feature Title'),
              'caption': _('Click here to edit the feature.'),
              'src': theme_url+'/assets/f2.png'
            },
            {
              'title': _('Feature Title'),
              'caption': _('Click here to edit the feature.'),
              'src': theme_url+'/assets/f3.png'
            }
         ]}}"
         ng-model="meta.series">

      <div class="col-lg-3 col-md-6 text-center"
           ng-repeat="item in meta.series">
        <div class="p-3 active-item"
             series-item>
          <figure class="w-50 py-1 m-auto">
            <img class="rounded-circle thumbnail"
                 ref="icon"
                 ng-src="{{g.trans_img}}"
                 style="{{item.src|bg_img}}"
                 alt="{{item.title}}" />
          </figure>
          <h5 class="text-nowrap title"
              ref="title">
            {{item.title || '&nbsp;'}}
          </h5>
          <p class="text-clamp-3"
             ref="caption">
            {{item.caption}}
          </p>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 text-center">
        <div class="p-3 active-item"
             series-item-create>
          <figure class="w-50 py-1 m-auto">
            <img class="rounded-circle thumbnail"
                 ref="icon"
                 ng-src="{{g.trans_img}}"
                 style="{{theme_url+'/assets/add.png'|bg_img}}"
                 alt="{{item.title}}" />
          </figure>
          <h5 class="text-nowrap title">
            {{_('Create New Feature')}}
          </h5>
          <p class="text-clamp-3">
            {{_('Click here add a new feature.')}}
          </p>
        </div>
      </div>

    </div>
  </div>
</section>
