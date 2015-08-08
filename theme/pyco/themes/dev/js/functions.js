/**
Soopro Theme Styles
http://www.soopro.com

Author:   redy
Date:     19 Apr 2015
Version: 2.0
**/

$(document).ready(function () {
  // Gallery
  $('.gallery-container').each(function(){
    $(this).magnificPopup({
      delegate: '.gallery-image', 
      type: 'image',
      gallery: {
        enabled:true,
        tCounter: '<span class="mfp-counter">%curr% / %total%</span>'
      },
      removalDelay: 300,
      mainClass: 'mfp-fade'
    });
  });
  
  // collapse
  $('.nav-toggle').click(function(){
    target = $(this).data("target");
    $(target).toggle();
  });

  // Register email
  var email, reg_url;
  is_email = function(email){
    var pattern = "^[a-z0-9!#$%&'*+/=?^_`{|}~-]+"+
                  "(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@"+
                  "(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+"+
                  "[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$";
    var re = RegExp(pattern, "ig");
    return re.test(email);
  };
  
  $(".register-btn").attr('disabled','disabled');
  
  refresh_email = function(){
    email = $("#input-register").val()
    reg_url = $(".register-btn").data("register")+'?email='+email
    if(!is_email(email)){
      $(".register-btn").attr('disabled','disabled');
    }else{
      $(".register-btn").removeAttr('disabled');
    }
  }
  
  $("#input-register").change(refresh_email).keyup(refresh_email);
  
  $(".register-btn").click(function(){
    reg_url = $(".register-btn").data("register")+'?email='+email
    target = $(".register-btn").data("target");
    if(target == "_blank"){
      window.open(reg_url)
    }else{
      window.location.href = reg_url
    }
  });
});