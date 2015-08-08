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
            <button type="button" class="navbar-toggle" data-toggle="collapse"
            data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">触发导航菜单</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">{{site_meta.title}}</a>
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
<header class="intro-header" style="background-image: url('{{theme_url}}img/post-bg.jpg')" sup-editor-media="bg" ng-model="meta.kv">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="post-heading">
                    <h1 sup-editor-meta ng-model="meta.title">
                      文章标题
                    </h1>
                    <h2 class="subheading" sup-editor-meta
                    ng-model="meta.description">
                      这里写文章的副标题
                    </h2>
                    <span class="meta">
                      由 {{meta.author}} 撰写于 {{meta.date_formatted}}
                    </span>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- Post Content -->
<article>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 content-box" sup-angular-wysiwyg ng-model="content">
                <p>我们有个坐飞机从来不用掏钱的实习生，他说他以前也是比较中二，喜欢跟别人争一件事的是非，如今自称也成熟了很多，遇到这些事都是这样的态度了：跟你争就算赢了也没什么好处，还会浪费时间，你还是自生自灭去吧，我去做我认为是正确的事情。他说之前他爸一直在黑他写代码没前途、不靠谱怎样怎样，没事还在饭桌上损损他，据说以前的非常叛逆，非得顶嘴争一下，现在都懒得争，说去吧，继续写他自己的代码。</p>
 <p>争论是没意义的，除非争论能够解决实质性的问题。如果不能解决什么问题，那么还是老老实实闭嘴，节约点时间，去认真做事吧。</p>

<p>要我说，成熟个屁，抄两行代码还闹出好多bug，有bug就算了，不测试就往Git上提，提也就算了，还要提在Develop分支，这不脑残添乱吗？做事要有态度懂吗，态度！事情做的半吊子，交差完事儿，那是交作业，学校上课给惯的。</p>

                <a href="#">
                    <img class="img-responsive" src="{{theme_url}}/img/post-sample-image.jpg" alt="">
                </a>
                <span class="caption text-muted">没事儿少读点儿书，多做点儿事儿，不然你没啥竞争力</span>


                <p>
                  照片来自 
                  <a href="https://www.flickr.com/photos/nasacommons/">
                  NASA on The Commons</a>.
                </p>
            </div>
        </div>
    </div>
</article>

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
