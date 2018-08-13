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
    <div class="text-center">
      <div class="content"
           sup-angular-wysiwyg
           default="{{_('$_CONTENT')}}"
           ng-model="content"></div>
    </div>
    <div class="row"
         sup-widget-series
         default="{{[
            {
              'title': _('Team Member'),
              'subtitle': _('Free'),
              'caption': _('Click here to edit the service.'),
              'src': theme_url+'/styles/t1.png'
            },
            {
              'title': _('Team Member'),
              'subtitle': _('Free'),
              'caption': _('Click here to edit the service.'),
              'src': theme_url+'/styles/t2.png'
            },
            {
              'title': _('Team Member'),
              'subtitle': _('Free'),
              'caption': _('Click here to edit the service.'),
              'src': theme_url+'/styles/t3.png'
            }
         ]}}"
         ng-model="meta.series">

      <div class="col-lg-3 col-md-6"
           ng-repeat="item in meta.series">
        <div class="px-4">
          <figure class="w-75 py-3">
            <img class="avatar"
                 ng-src="{{g.trans_img}}"
                 style="{{item.src|bg_img}}"
                 alt="{{item.title}}" />
          </figure>
          <h5 class="text-nowrap title">
            {{item.title || '&nbsp;'}}
          </h5>
          <p class="text-nowrap subtitle text-uppercase">
            {{item.subtitle || '&nbsp;'}}
          </p>
          <div sup-bind-html="item.extra"></div>
        </div>
      </div>

    </div>
  </div>
</section>
