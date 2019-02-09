<!-- Header -->
<header class="fixed-top">
  <nav class="navbar navbar-expand-lg affix"
       toggle-affix>
    <div class="container-fluid">
      <a class="navbar-brand"
         href="#">
        {{site_meta.title}}
      </a>

      <button class="btn icon-btn navbar-toggler"
              type="button"
              data-toggle="collapse"
              data-target="#primary-navbar"
              aria-expanded="false"
              aria-label="{{_('Toggle navigation')}}">
        <svg width="24" height="24" viewBox="0 0 24 24"><path d="M3 18h18v-2H3v2zm0-5h18v-2H3v2zm0-7v2h18V6H3z"/></svg>
      </button>

      <div id="primary-navbar"
           class="collapse navbar-collapse">
        <ul class="navbar-nav mx-auto">
          <li class="nav-item {{menu.class}}"
              ng-repeat="menu in menu.primary">
            <a class="nav-link"
               target="{{menu.target}}"
               href="#">{{menu.name}}</a>
          </li>
        </ul>
        <div class="navbar-aside"
             ng-if="languages">
          <button class="btn icon-btn open-modal-language"
                  type="button"
                  data-mfp-src="#MODAL-language-switcher"
                  data-effect="mfp-slide-bottom">
            <svg width="24" height="24" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"/><path d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zm6.93 6h-2.95c-.32-1.25-.78-2.45-1.38-3.56 1.84.63 3.37 1.91 4.33 3.56zM12 4.04c.83 1.2 1.48 2.53 1.91 3.96h-3.82c.43-1.43 1.08-2.76 1.91-3.96zM4.26 14C4.1 13.36 4 12.69 4 12s.1-1.36.26-2h3.38c-.08.66-.14 1.32-.14 2 0 .68.06 1.34.14 2H4.26zm.82 2h2.95c.32 1.25.78 2.45 1.38 3.56-1.84-.63-3.37-1.9-4.33-3.56zm2.95-8H5.08c.96-1.66 2.49-2.93 4.33-3.56C8.81 5.55 8.35 6.75 8.03 8zM12 19.96c-.83-1.2-1.48-2.53-1.91-3.96h3.82c-.43 1.43-1.08 2.76-1.91 3.96zM14.34 14H9.66c-.09-.66-.16-1.32-.16-2 0-.68.07-1.35.16-2h4.68c.09.65.16 1.32.16 2 0 .68-.07 1.34-.16 2zm.25 5.56c.6-1.11 1.06-2.31 1.38-3.56h2.95c-.96 1.65-2.49 2.93-4.33 3.56zM16.36 14c.08-.66.14-1.32.14-2 0-.68-.06-1.34-.14-2h3.38c.16.64.26 1.31.26 2s-.1 1.36-.26 2h-3.38z"/></svg>
          </button>
        </div>

      </div>
    </div>
  </nav>
</header>
