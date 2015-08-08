<!-- Bootstrap Core CSS -->
<link href="{{theme_url}}css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="{{theme_url}}css/clean-blog.min.css" rel="stylesheet">
<link href="{{theme_url}}css/sup-custom.css" rel="stylesheet">
<!-- Navigation -->
<nav class="navbar navbar-default navbar-custom navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header page-scroll">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">触发导航菜单</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#" fake-link>{{site_meta.title}}</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right" sup-editor-query
            metas="{nav:'-'}" results="nav">
                <li ng-repeat="item in query.nav">
                    <a href="#" fake-link>{{item.nav}}</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
<!-- Page Header -->
<!-- Set your background image for this header on the line below. -->
<header class="intro-header" style="background-image: url('{{theme_url}}img/home-bg.jpg')" sup-editor-media ng-model="meta.kv">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="page-heading">
                    <h1 sup-editor-meta ng-model="meta.title">404</h1>
                    <h2 class="subheading" sup-editor-meta ng-model="meta.description">Error 404 没有找到页面。</h2>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Main Content -->
<div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1" sup-angular-wysiwyg ng-model="content">
            <p>随便写几个字告诉别人，页面为啥没有找到。没找到什么意思？当然就是页面根本不存在，为啥没会不存在？你没写当然不存在。什么？你写了？你看看清楚写错没写错再说。再不行就找技术支持。</p>
        </div>
    </div>
</div>
<hr>
<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <p class="copyright text-muted">{{site_meta.copyright}}</p>
            </div>
        </div>
    </div>
</footer>
