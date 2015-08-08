<!-- Webfonts -->
<link href='{{ theme_url }}font/webfonts.css' rel='stylesheet' type='text/css'>

<!-- Bootstrap core CSS -->
<link href="{{ theme_url }}lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Lightbox CSS -->
<link href="{{ theme_url }}lib/lightbox/css/lightbox.css" rel="stylesheet">

<!-- Styles-->
<link href="{{ theme_url }}css/style.css" rel="stylesheet" type='text/css'>
<link href="{{ theme_url }}css/{{lang}}.css" rel="stylesheet" type='text/css'>
<div id="wrapper">
	<!-- Header -->
	<header id="header" class="container">
		<div class="row">
			<div id="language" class="col-md-2 col-sm-2 pull-right">
				<span id="language-switcher" class="language-switcher-btn-disabled">
                    Languages
                </span>
			</div>
			<div id="logo" class="col-md-2 col-sm-2">
				<a href="#" class="logo-graph" 
                ng-style="{'background-image':site_meta.logo ? 'url('+ site_meta.logo +')':'' }">
                    {{site_meta.title}}
                </a>
			</div>

			<nav id="nav" class="col-md-4 col-sm-4">
				<ul sup-editor-menu-query menu="primary" results="nav">
					<li ng-repeat="item in query.nav">
                        <a href="#">{{item.title}}</a>
                    </li>
				</ul>
			</nav>
		</div>
	</header>
	<!-- #Header -->
	<!-- Tagline -->
	<div class="container">
		<section class="jumbotron">
			<h1 sup-editor-meta ng-model="meta.tagline">
                PERFECT ONLINE SOLUTIONS<br>FOR MICRO BUSINESS.
            </h1>
		</section>
	</div>
	<!-- #Tagline -->
	<!-- Contents -->
	<div class="container">
		<section class="row works-list" sup-editor-content-query
        fields="{type:'works'}"
        length="{{theme_meta.options.perpage}}"
        sortby="{{theme_meta.options.sortby}}"
        results="works">
		    <figure class="col-md-3 col-sm-6 show" ng-repeat="item in query.works" ng-if="item.title && item.featured_img">
                <a href="#">
  				    <figcaption>{{item.title}}</figcaption>
  				    <img ng-src="{{item.featured_img | thumbnail}}" title="{{item.title}}" alt="{{item.title}}" />
                </a>
			</figure>
		</section>
		<section class="row">
			<div class="col-md-3 pull-right more">
				<a class="btn-more" href="#more" ontouchstart="btn-more-on">More</a>
			</div>
		</section>
	</div>
	<!-- #Contents -->
	<!-- Footer -->
	<footer class="container">
		<hr>
		<p id="cp">{{site_meta.copyright}}</p>
	</footer>
	<!-- #Footer -->
</div>