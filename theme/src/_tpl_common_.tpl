<div svg-sprites-loader 
 data-url="{{ site_meta.svg_sprites || theme_url+'/styles/svgdefs.svg' }}"
 data-name="base"></div>

<sup-set ng-model="g.default_img_360x360"
         value="{{theme_url}}/styles/default_img_360x360.png"></sup-set>

<link ng-href="{{theme_url}}/styles/normalize.css" rel="stylesheet">
<link ng-href="{{theme_url}}/styles/fonts/roboto-fonts.css" rel="stylesheet">
<link ng-href="{{theme_url}}/styles/simba.css" rel="stylesheet">

<sup-script file="svg-sprites-render.min.js"></sup-script>