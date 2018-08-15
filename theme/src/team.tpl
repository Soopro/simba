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
              'subtitle': _('Job Title'),
              'caption': _('Click here to edit the member.'),
              'src': theme_url+'/assets/t1.jpg',
              'extra': '<ul><li>xxxxx xxx xxxxx</li><li>xxxxx xxxxxx xxxx</li></ul>'
            },
            {
              'title': _('Team Member'),
              'subtitle': _('Job Title'),
              'caption': _('Click here to edit the member.'),
              'src': theme_url+'/assets/t2.jpg',
              'extra': '<ul><li>xxxxx xxx xxxxx</li><li>xxxxx xxxxxx xxxx</li></ul>'
            },
            {
              'title': _('Team Member'),
              'subtitle': _('Job Title'),
              'caption': _('Click here to edit the member.'),
              'src': theme_url+'/assets/t3.jpg',
              'extra': '<ul><li>xxxxx xxx xxxxx</li><li>xxxxx xxxxxx xxxx</li></ul>'
            }
         ]}}"
         allow-fields="subtitle, extra"
         ng-model="meta.series">

      <div class="col-lg-3 col-md-6"
           ng-repeat="item in meta.series">
        <div class="p-3"
             series-item>
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

      <div class="col-lg-3 col-md-6">
        <div class="p-3"
             series-item-create>
          <figure class="w-75 py-3">
            <img class="avatar"
                 ng-src="{{g.trans_img}}"
                 style="{{theme_url+'/assets/add.png'|bg_img}}" />
          </figure>
          <h5 class="text-nowrap title">
            {{_('Create New Member')}}
          </h5>
          <p class="text-nowrap subtitle text-uppercase">
            {{_('Click here to add new one.')}}
          </p>
        </div>
      </div>

    </div>
  </div>
</section>
