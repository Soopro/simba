{% import 'g.tpl' %}
{% include '_css.tpl' %}

<section id="{{meta.slug}}"
         class="segment {{meta.bg.class}}"
         style="{{meta.bg.style}}">
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
      <h4 class="lead">
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
           {'name':_('2 Columns'),
            'type':'column',
            'code':'<div class=&quot;row text-left&quot;>
              <div class=&quot;col-sm&quot;><p>'+_('$_CONTENT')+'</p></div>
              <div class=&quot;col-sm&quot;><p>'+_('$_CONTENT')+'</p></div>
              </div>'}
           ]"
           ng-model="content"></div>
    </div>
  </div>
</section>
