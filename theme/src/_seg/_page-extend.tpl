<section id="{{page.slug}}"
         class="segment bg-cover bg-fixed {{page.bg.class or 'bg-secondary'}}"
         style="{{(page.bg.src || '')|bg_img}}">
  <div class="container">
    <header>
      <h4>{{page.title || _('Title')}}</h4>
    </header>
    <div class="m-auto text-center">
      <div class="content"
           sup-bind-html="page.content"></div>
    </div>
  </div>
</section>
