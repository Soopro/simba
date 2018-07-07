<section id="{{page.slug}}"
         class="segment-wrapper {{page.bg.class}}"
         style="{{page.bg.style}}">
  <header class="container">
    <h2 class="section-heading"
        sup-bind-html="page.title || _('Title')">
    </h2>
    <hr class="divider">
    <p class="caption text-center"
       sup-bind-html="page.description"></p>
  </header>

  <div class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div class="content"
             sup-bind-html="page.content"></div>
      </div>
    </div>
  </div>
</section>
