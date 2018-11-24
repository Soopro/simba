(function($) {
  "use strict";

  $('.open-modal-language').magnificPopup({
    type: 'inline',
    showCloseBtn: false,
    preloader: false,
    removalDelay: 600,
    fixedContentPos: true,
    callbacks: {
      beforeOpen: function() {
        this.st.mainClass = this.st.el.attr('data-effect');
      }
    },
  });


  $('.open-modal-detail').click(function(e){
    var curr_modal = null;
    var curr_hammer = null;
    var el = $(this);
    var effect_type = el.data('effect');

    var inject_map = {
      icon_style: el.find('[ref=icon]').attr('style'),
      icon_bg: el.find('[ref=icon]').data('icon-bg') || '',
      title: el.find('[ref=title]').html() || '',
      subtitle: el.find('[ref=subtitle]').html() || '',
      caption: el.find('[ref=caption]').html() || '',
      content: el.find('[ref=extra]').html() || '',
      poster: el.find('[ref=poster]').html() || '',
    };

    var tmpl = $('#MODAL-TMPL-detail').html().trim();
    for (var k in inject_map) {
      var regex = new RegExp('%'+k+'%', 'ig');
      tmpl = tmpl.replace(regex, inject_map[k].trim());
    }

    $.magnificPopup.open({
      items: {
        src: tmpl,
        type: 'inline',
      },
      alignTop: true,
      overflowY: 'hidden',
      showCloseBtn: false,
      preloader: false,
      removalDelay: 600,
      fixedContentPos: true,
      callbacks: {
        beforeOpen: function() {
          this.st.mainClass = effect_type;
        },
        open: function() {
          curr_modal = this.content;
          curr_modal.find('.modal-close').on('click', function(e){
            e.preventDefault();
            $.magnificPopup.close();
          });
          if ($(window).width() <= 991) {
            var start_point = NaN;
            var touch_step = 120;
            curr_modal.on("touchstart", function(e){
              try {
                start_point = e.touches[0].clientX;
              } catch(err) {
                console.error(err)
              }
            });
            curr_modal.on("touchmove", function(e){
              var touched = e.touches[0];
              if (start_point - touched.clientX > touch_step) {
                $.magnificPopup.close();
                console.log(touched.clientX - start_point > touch_step);
              }
            });
          }
        },
        beforeClose: function() {
          if (curr_modal) {
            curr_modal.find('.modal-close').off();
            curr_modal.off("touchmove");
          }
        }
      },
    });
  });


  // modal paper
  $('.modal-paper').each(function(e){

  });

  $('.modal-close').on('click', function(e){
    e.preventDefault();
    $.magnificPopup.close();
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
    var offset = el.attr('offset') || 60;
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

  $('.nav-link, .nav-scroll').on('click', function(e) {
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

    // closes the responsive menu after clicked.
    $('.navbar-collapse').collapse('hide');
  });

})(jQuery);
