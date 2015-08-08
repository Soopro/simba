<!-- Webfonts -->
<link href='{{ theme_url }}font/webfonts.css' rel='stylesheet' type='text/css'>

<!-- Bootstrap core CSS -->
<link href="{{ theme_url }}lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" type='text/css'>
<!-- Lightbox CSS -->
<link href="{{ theme_url }}lib/lightbox/css/lightbox.css" rel="stylesheet" type='text/css'>

<!-- Styles-->
<link href="{{ theme_url }}css/style.css" rel="stylesheet" type='text/css'>
<link href="{{ theme_url }}css/{{lang}}.css" rel="stylesheet" type='text/css'>
<div id="wrapper">
	<!-- Header -->
	<header id="header" class="container" unselectable="on">
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
			<h1 class="title" sup-editor-meta ng-model="meta.title">
        Page Title
      </h1>
		</section>
	</div>
	<!-- #Tagline -->
	<!-- Contents -->
	<div class="container">
		<div sup-angular-wysiwyg="sup-editor" ng-model="content">
			<h2>This is default content preset</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
			<div><img src="{{ theme_url }}/sample_image.png" alt="sample"></div>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
		</div>
	</div>
	<!-- #Contents -->
	<!-- Footer -->
	<footer class="container">
		<hr>
		<p id="cp">{{site_meta.copyright}}</p>
	</footer>
	<!-- #Footer -->
</div>