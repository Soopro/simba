<header>
<nav class="navbar navbar-default navbar-fixed-top affix">

  <!-- Brand and toggle get grouped for better mobile display -->
    <a class="navbar-brand"
      href="#">{{site_meta.title}}</a>
    <button class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#primary-nav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="primary-nav">
      <ul class="navbar-nav ">
        <li ng-repeat="menu in menu.primary">
          <a href="#"
             class="page-scroll {{menu.class}}"
             target="{{menu.target}}">{{menu.name}}</a>
        </li>
      </ul>
    </div>
</nav>
</header>