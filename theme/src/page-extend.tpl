{% import 'g.tpl' %}
{% include '_css.tpl' %}
{% include '_header.tpl' %}

<div sup-gap="10"></div>

<section id="{{meta.slug}}"
         class="segment-wrapper no-border {{meta.bg.class}}"
         style="{{meta.bg.style}}">
  <div sup-widget-bg
       presets="[
         {'key': 'palette-dark', 'label': _('Darkness')}
       ]"
       ng-model="meta.bg"></div>
  <header class="contianer">
    <h2 class="section-heading">
      <span sup-widget-text
            default="{{_('Title')}}"
            ng-model="meta.title"></span>
    </h2>
    <hr class="divider">
    <p class="caption text-center">
      <span sup-widget-text
            default="{{_('Description text here')}}"
            ng-model="meta.description"></span>
    </p>
  </header>
  <div class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="content"
             sup-angular-wysiwyg
             default="{{_('$_CONTENT')}}"
             ng-model="content"></div>
      </div>
    </div>
  </div>
</section>
