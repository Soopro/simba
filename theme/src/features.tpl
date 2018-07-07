{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div sup-gap="10"></div>

<section id="{{meta.slug}}" class="segment-wrapper no-border">
  <header class="container">
    <h2 class="section-heading">
      <span sup-widget-text
            default="{{_('Title')}}"
            ng-model="meta.title"></span>
    </h2>
    <hr class="divider">
  </header>
  <div class="container">
    <div class="row"
         sup-widget-series
         default="{{[
            {
              'title': _('Feature Title'),
              'caption': _('Click here to edit the feature.'),
              'src': theme_url+'/styles/f1.png'
            },
            {
              'title': _('Feature Title'),
              'caption': _('Click here to edit the feature.'),
              'src': theme_url+'/styles/f2.png'
            },
            {
              'title': _('Feature Title'),
              'caption': _('Click here to edit the feature.'),
              'src': theme_url+'/styles/f3.png'
            }
         ]}}"
         ng-model="meta.series">

      <div class="col-md-3 col-sm-6 text-center"
           ng-repeat="item in meta.series">
        <div class="feature-box"
             series-item>
          <figure>
            <img ng-src="{{theme_url}}/styles/trans.png"
                 class="img-responsive thumbnail-img"
                 style="{{item.src|bg_img}}" />
          </figure>
          <h3 class="text-nowrap">
            {{item.title || _('Item Title')}}
          </h3>
          <p class="text-muted text-clamp-3">
            {{item.caption || _('Item Caption')}}
          </p>
        </div>
      </div>

      <div class="col-md-3 col-sm-6 text-center">
        <div class="feature-box"
             series-item-create>
          <figure>
            <img ng-src="{{theme_url}}/styles/trans.png"
                 class="img-responsive thumbnail-img"
                 style="{{g.add_img|bg_img}}" />
          </figure>
          <h3 class="text-nowrap">
            {{_('Create New Service')}}
          </h3>
          <p class="text-muted text-clamp-3">
            {{_('Click here add a new feature.')}}
          </p>
        </div>
      </div>

    </div>
  </div>
</section>
