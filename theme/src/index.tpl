{% import 'g.tpl' %}
{% include '_css.tpl' %}

{% include '_header.tpl' %}

<section id="{{meta.slug}}"
         class="d-flex align-items-center justify-content-center
                hero bg-cover bg-fixed {{meta.hero.class}}"
         style="{{meta.hero.style}}">
  <div sup-widget-bg
       presets="[
          {'key': 'text-light', 'label': _('Light Text')},
          {'key': 'text-dark', 'label': _('Dark Text')},
       ]"
       ng-model="meta.hero"></div>
  <div>
    <h1>
      <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
    </h1>
    <h3 class="lead">
      <span sup-widget-text
            default="{{_('Description text here')}}"
            ng-model="meta.description"></span>
    </h3>
    <a class="start-btn anim-fade-in-out nav-scroll"
       href="#">
      <svg width="48" heigth="48" viewBox="0 0 48 48"><path d="M14,24A10,10,0,1,1,24,34,10.0036,10.0036,0,0,1,14,24Zm10,6a6,6,0,1,0-6-6A6.0048,6.0048,0,0,0,24,30Z"/><path d="M19.41,40,24,44.58,28.59,40,30,41.41l-6,6-6-6Z"/></svg>
    </a>
  </div>
</section>

<div sup-widget-segments ng-model="segments">
  <div ng-repeat="page in segments">
  	<!-- segments -->
    <div ng-if="page.template == 'page'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_page.tpl" %}
    </div>
    <div ng-if="page.template == 'page-extend'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_page-extend.tpl" %}
    </div>
    <div ng-if="page.template == 'features'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_features.tpl" %}
    </div>
    <div ng-if="page.template == 'services'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_services.tpl" %}
    </div>
    <div ng-if="page.template == 'team'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_team.tpl" %}
    </div>
  	<!-- #segments -->
  </div>

  <section class="segment">
    <div class="container">
      <div segment-create="major"></div>
    </div>
  </section>

</div>

{% include '_footer.tpl' %}
