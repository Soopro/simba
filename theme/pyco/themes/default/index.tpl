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
            <button type="button" class="navbar-toggle" 
            data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">触发导航菜单</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">{{site_meta.title}}</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right" sup-editor-query
            metas="{nav:'-'}" results="nav">
                <li ng-repeat="item in query.nav">
                    <a href="#">{{item.nav}}</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
<!-- Page Header -->
<!-- Set your background image for this header on the line below. -->
<header class="intro-header" style="background-image: url('{{ theme_url }}img/home-bg.jpg')" sup-editor-media="bg"  ng-model="meta.kv">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="site-heading">
                    <h1 sup-editor-meta ng-model="meta.title">默认主题</h1>
                    <hr class="small">
                    <span class="subheading" sup-editor-meta
                    ng-model="meta.description">
                      这是默认主题，也就让你随便写写
                    </span>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Main Content -->
<div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1"
        sup-editor-query fields="{type:'post'}" length="6"
        sort="{by:'updated',direction:'desc'}" results="pages">
            <div ng-repeat="item in query.pages">
				<div class="post-preview">
                    <a href="#">
                        <h2 class="post-title">
                            {{item.title}}
                        </h2>
                        <h3 class="post-subtitle">
                            {{item.description}}
                        </h3>
                    </a>
                    <p class="post-meta">
                      由 <a href="#" >{{item.author}}</a> 撰写于
                      {{item.date_formatted}}
                    </p>
                </div>
                <hr>
			</div>
            <!-- Pager -->
            <ul class="pager">
                <li class="next">
                    <a href="#" >以前的文章 &rarr;</a>
                </li>
            </ul>
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
