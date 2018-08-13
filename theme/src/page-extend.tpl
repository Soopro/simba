{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div class="editor-top"></div>

<section id="{{meta.slug}}"
         class="segment bg-cover bg-fixed {{meta.bg.class}}"
         style="{{(meta.hero.src || g.extend_bg)|bg_img}}">
  <div sup-widget-bg
       presets="[
         {'key': 'bg-secondary', 'label': _('Special')}
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
