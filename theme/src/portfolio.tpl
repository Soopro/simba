{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div sup-gap="10"></div>

<section id="{{meta.slug}}"
         class="segment-wrapper no-padding no-border">

  <div class="container-fluid">
    <div class="row no-gutter"
         sup-widget-series
         default="{{[
           {
             'title': _('Works Title'),
             'caption': _('Click here to edit the works.'),
             'src': theme_url+'/styles/p1.jpg'
           },
           {
             'title': _('Works Title'),
             'caption': _('Click here to edit the works.'),
             'src': theme_url+'/styles/p2.jpg'
           },
           {
             'title': _('Works Title'),
             'caption': _('Click here to edit the works.'),
             'src': theme_url+'/styles/p3.jpg'
           },
           {
             'title': _('Works Title'),
             'caption': _('Click here to edit the works.'),
             'src': theme_url+'/styles/p4.jpg'
           },
           {
             'title': _('Works Title'),
             'caption': _('Click here to edit the works.'),
             'src': theme_url+'/styles/p5.jpg'
           }
         ]}}"
         ng-model="meta.series">

      <div class="col-md-4 col-sm-6"
           ng-repeat="item in meta.series">
        <a href="#"
           class="portfolio-box"
           sup-ico-inset="top"
           series-item>
          <img ng-src="{{theme_url}}/styles/trans.png"
               class="img-responsive thumbnail-img"
               style="{{item.src|bg_img}}">
          <div class="portfolio-box-caption">
            <div class="portfolio-box-caption-content">
              <div class="project-name text-nowrap">
                {{item.title}}
              </div>
              <div class="project-caption caption">
                {{item.caption}}
              </div>
            </div>
          </div>
        </a>
      </div>

      <div class="col-md-4 col-sm-6">
        <a href="#"
           class="portfolio-box"
           sup-ico-inset="top"
           series-item-create>
          <img ng-src="{{theme_url}}/styles/trans.png"
               class="img-responsive thumbnail-img"
               style="{{g.add_img|bg_img}}">
          <div class="portfolio-box-caption">
            <div class="portfolio-box-caption-content">
              <div class="project-name text-nowrap">
                {{_('Create New Works')}}
              </div>
              <div class="project-caption caption">
                {{_('Click here to add a new works.')}}
              </div>
            </div>
          </div>
        </a>
      </div>

    </div>
  </div>
</section>
