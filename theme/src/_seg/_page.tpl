<section id="{{page.slug}}"
         class="segment">
  <article class="container text-center">
    <header>
      <h2>{{page.title || _('Title')}}</h2>
      <h4 class="lead">{{page.description}}</h4>
    </header>
    <div class="m-auto text-center">
      <div class="content"
           sup-bind-html="page.content"></div>
  </article>
</section>
