<div svg-sprites-render
 data-url="{{ site_meta.svg_sprites ||
              theme_url+'/styles/svg_sprites.svg' }}?{{theme_meta.version}}"
 data-name="base"></div>

<sup-set ng-model="g.default_img_360x360"
         value="{{theme_url+'/styles/default_img_360x360.png'}}"></sup-set>
<sup-set ng-model="g.default_img_240x240"
         value="{{theme_url+'/styles/default_img_240x240.png'}}"></sup-set>

<!-- build:replace css-->
<!-- <link ng-href="{{theme_url}}/simba.min.css?md5=null" rel="stylesheet"> -->
<link ng-href="{{theme_url}}/styles/normalize.css" rel="stylesheet">
<link ng-href="{{theme_url}}/styles/fonts/roboto-fonts.css" rel="stylesheet">
<link ng-href="{{theme_url}}/styles/simba.css" rel="stylesheet">
<!-- /build -->

<sup-script-loader path="svg/svg-sprites-render.min.js?md5=null">
</sup-script-loader>

<style ng-bind="theme_meta.styles"></style>