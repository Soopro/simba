(function($) {
  "use strict";

  $('.open-modal').magnificPopup({
    type: 'inline',
    showCloseBtn: false,
    preloader: false,
    removalDelay: 600,
    callbacks: {
      beforeOpen: function() {
        this.st.mainClass = this.st.el.attr('data-effect');
      }
    },
  });

  $('.open-modal-detail').magnificPopup({
    tLoading: '...',
    type: 'inline',
    removalDelay: 600,
    callbacks: {
      beforeOpen: function() {
        this.st.mainClass = this.st.el.attr('data-effect');
      }
    },
  });

  var toggleAffix = function(affixElement, scrollElement, offset) {

    var height = affixElement.outerHeight();

    if (scrollElement.scrollTop() >= offset) {
        affixElement.addClass("affix");
    } else {
        affixElement.removeClass("affix");
    }

  };

  $('[data-toggle="affix"]').each(function() {
    var el = $(this);
    var offset = el.attr('offset') || 100;
    $(window).on('scroll resize', function() {
        toggleAffix(el, $(this), offset);
    });
    // init
    toggleAffix(el, $(window), offset);
  });

  $('.start-btn').each(function() {
    var seg_id = $('.segment').attr('id');
    if (seg_id) {
      $(this).attr('href', '#'+seg_id);
    }
  });

  $('.nav-link, .nav-scroll').bind('click', function(e) {
    e.preventDefault();
    var anchor = $(this);
    var scorll_target;
    try {
        scorll_target = $(anchor.attr('href'));
    } catch (e) {
        scorll_target = []
    }
    var pos_top = 0;
    if (scorll_target.length > 0){
      pos_top = scorll_target.offset().top
    } else {
      pos_top = 0
    }
    $('html, body').stop().animate({
        scrollTop: pos_top - 60
    }, 1200, 'easeInOutExpo');
  });


  // Closes the Responsive Menu on Menu Item Click
  $('.navbar-collapse ul li a').click(function() {
    $('.navbar-toggle:visible').click();
  });

})(jQuery); // End of use strict
