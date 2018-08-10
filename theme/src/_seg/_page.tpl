<section id="{{page.slug}}"
         class="segment">
  <article class="container text-center">
    <header>
      <h2>{{page.title || _('Title')}}</h2>
    </header>
    <div class="content m-auto text-center"
         sup-bind-html="page.content"></div>
  </article>
</section>
