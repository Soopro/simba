<section id="{{page.slug}}"
         class="segment bg-cover bg-fixed {{page.bg.class or 'bg-secondary'}}"
         style="{{(page.bg.src || g.extend_bg)|bg_img}}">
  <div class="container">
    <header>
      <h4>{{page.title || _('Title')}}</h4>
    </header>
    <div class="content m-auto text-center"
         sup-bind-html="page.content"></div>
  </div>
</section>
