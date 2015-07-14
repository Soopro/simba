# -------------------------------
# Simba Javascript
#
# Description: A Theme for soopro.com
# http://www.soopro.com
#
# Author:   redy
# Date:     3 July 2015
# Version: 2.5
# -------------------------------

#
# $(document).ready(function () {
#     $('a.parallaxlink[href*=#]').click(function() {
#         var target_top=0;
#         var current_hash='';
#         if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
#             if(this.hash){
#                 var target = $(this.hash)
#                 target = target.length ? target : $('[name=' + this.hash.slice(1) +']')
#                 if (target.length) {
#                     target_top=target.offset().top
#                     current_hash=this.hash;
#                 }
#             }
#         }
#         $('html,body').animate({
#           scrollTop: target_top
#         }, 1000, function() {
#             window.location.hash=current_hash;
#         });
#         return false;
#     });
#
#     resizeHandler(true);
#
#     $(window).resize( function(){
#         resizeHandler();
#     });
#
#     function resizeHandler(force){
#         if ($('#main').length >0){
#             var win_height=$(window).height()
#             var offset=$('#main').data('offset');
#             if(!offset){
#                 offset=0;
#             }
#             var obj_height=$('#main').data('height')
#
#             if (!obj_height){
#                 obj_height=$('#main').height();
#                 $('#main').data('height',obj_height);
#             }
#
#             var new_height=win_height-offset;
#             if (new_height<obj_height){
#                 new_height=obj_height;
#             }
#
#             if (force){
#                 $('#main').height(new_height);
#             }else{
#                 $('#main').stop().animate({
#                     height:new_height
#                 },1000);
#             }
#         }
#     }
# });