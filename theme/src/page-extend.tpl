{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div class="editor-top"></div>

<section id="{{meta.slug}}"
         class="segment bg-cover bg-fixed {{meta.bg.class || 'bg-secondary'}}"
         style="{{(meta.hero.src || '')|bg_img}}">
  <div sup-widget-bg
       presets="[
          {'key': 'bg-primary', 'label': _('Primary Color Bg')}
          {'key': 'bg-light', 'label': _('Light Bg')},
          {'key': 'bg-dark', 'label': _('Dark Bg')},
       ]"
       ng-model="meta.bg"></div>
  <div class="container">
    <header>
      <h4>
        <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
      </h4>
    </header>
    <div class="m-auto text-center">
      <div class="content"
           sup-angular-wysiwyg
           default="{{_('$_CONTENT')}}"
           ng-model="content"></div>
    </div>
  </div>
</section>
