{% import 'g.tpl' %}
{% include '_css.tpl' %}

<sup-body class="parallax-major" style="{{meta.hero.style}}"></sup-body>

{% include '_header.tpl' %}
<section id="{{meta.slug}}"
         class="hero {{meta.hero.class}}">
  <div sup-widget-bg
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
    <a class="entrance anim-fade-in-out"
       href="#">
      <svg width="48" heigth="48" viewBox="0 0 48 48"><path d="M14,24A10,10,0,1,1,24,34,10.0036,10.0036,0,0,1,14,24Zm10,6a6,6,0,1,0-6-6A6.0048,6.0048,0,0,0,24,30Z"/><path d="M19.41,40,24,44.58,28.59,40,30,41.41l-6,6-6-6Z"/></svg>
    </a>
  </div>
</section>

{% include '_segments.tpl' %}

<div sup-widget-segments ng-model="segments">
  <section id="{{page.slug}}"
           class="segment {{page.bg.class}}"
           style="{{page.bg.style}}"
           ng-repeat="page in segments"
           sup-load-template="page.template"
           import-with-context="{'g':g, 'page':page}"
           segment>
  </section>
  <section class="segment">
    <div class="container">
      <div segment-create="major"></div>
    </div>
  </section>
</div>

{% include '_footer.tpl' %}

