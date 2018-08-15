<section id="{{page.slug}}"
         class="segment extend {{page.bg.class}}
                {{!page.bg.src && !page.bg.color ? 'default' : ''}}"
         style="{{page.bg.style}}">
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
