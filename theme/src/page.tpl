{% import 'g.tpl' %}
{% include '_css.tpl' %}

<section id="{{meta.slug}}"
         class="segment {{meta.bg.class}}"
         style="{{meta.bg.style}}">
  <div class="page-attrs">
    <div sup-widget-attrs
         ng-model="meta.attrs"
         outline-none
         structure="[
           {'key': 'hide_description',
            'label': _('Hide Description Text'),
            'value': false,
            'type': 'switch'},
         ]"></div>
  </div>
  <div sup-widget-bg
       presets="[
          {'key': 'parallax-bg', 'label': _('Parallax')},
          {'key': 'glassy', 'label': _('Glassy')},
       ]"
       ng-model="meta.bg"></div>
  <div class="container">
    <header>
      <h2>
        <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
      </h2>
      <h4 class="lead"
          ng-show="!meta.attrs.hide_description">
        <span sup-widget-text
              default="{{_('Description text here')}}"
              ng-model="meta.description"></span>
      </h4>
    </header>
    <div class="m-auto text-center">
      <div class="content"
           sup-angular-wysiwyg
           default="{{_('$_CONTENT')}}"
           presets="[
           {'name':_('Single Column'),
            'type':'column',
            'code':'<div class=&quot;single-column&quot;>
              <p>'+_('$_CONTENT')+'</p>
              <p>'+_('$_CONTENT')+'</p>
              </div><div>&nbsp;</div>'},
           {'name':_('2 Columns'),
            'type':'column',
            'code':'<div class=&quot;row text-left&quot;>
              <div class=&quot;col-sm&quot;><p>'+_('$_CONTENT')+'</p></div>
              <div class=&quot;col-sm&quot;><p>'+_('$_CONTENT')+'</p></div>
              </div><div>&nbsp;</div>'}
           ]"
           text-styles="[
             {'class': 'text-primary', 'name': _('Primary Text'),
              'colorize': '#78909b'},
             {'class': 'text-secondary', 'name': _('Secondary Text'),
              'colorize': '#6b9e56'},
             {'class': 'text-danger', 'name': _('Danger Text'),
              'colorize': '#ff4136'}
           ]"
           ng-model="content"></div>
    </div>
  </div>
</section>
