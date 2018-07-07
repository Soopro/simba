{% import 'g.tpl' %}
{% include '_css.tpl' %}

{% include '_header.tpl' %}

<section id="{{meta.slug}}"
         class="hero {{meta.hero.class}}"
         style="{{meta.hero.style}}">
  <div sup-widget-bg ng-model="meta.hero"></div>
  <div class="header-content">
    <div class="header-content-inner">
      <div class="logo"
           style="{{site_meta.logo|bg_img}}"
           ng-if="site_meta.logo"></div>
      <h1>
        <span sup-widget-text
              default="{{_('Title')}}"
              ng-model="meta.title"></span>
      </h1>
      <hr class="divider">
      <p class="lead">
        <span sup-widget-text
              default="{{_('Description text here')}}"
              ng-model="meta.description"></span>
      </p>
      <a href="#"
         class="btn btn-primary btn-xl"
         sup-widget-link
         ng-model="meta.entrance">
         {{meta.entrance.name || _('Learn More')}}</a>
    </div>
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
    <div ng-if="page.template == 'portfolio'"
         sup-ico-inset="top"
         segment>
      {% include "_seg/_portfolio.tpl" %}
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
  	<!-- #segments -->
  </div>

  <section class="segment-wrapper">
    <div class="container">
      <div segment-create="major"></div>
    </div>
  </section>

</div>

{% include '_footer.tpl' %}
