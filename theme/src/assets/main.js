(function($) {
  "use strict";

  var toggleAffix = function(affixElement, scrollElement, offset) {

    var height = affixElement.outerHeight();

    if (scrollElement.scrollTop() >= offset) {
        affixElement.addClass("affix");
    } else {
        affixElement.removeClass("affix");
    }

  };

  $('[data-toggle="affix"]').each(function() {
    var el = $(this)
    var offset = el.attr('offset') || $(window).height() / 2;

    $(window).on('scroll resize', function() {
        toggleAffix(el, $(this), offset);
    });

    // init
    toggleAffix(el, $(window), offset);
  });


    // jQuery for page scrolling feature - requires jQuery Easing plugin
    $('a.page-scroll').bind('click', function(event) {
        var anchor = $(this);
        try {
            var scorll_target = $(anchor.attr('href'));
        } catch (e) {
            return true;
        }
        var pos_top = 0;
        if (scorll_target.length > 0){
          pos_top = scorll_target.offset().top
        }
        $('html, body').stop().animate({
            scrollTop: pos_top - 50
        }, 1250, 'easeInOut');
        event.preventDefault();
    });

    // Closes the Responsive Menu on Menu Item Click
    $('.navbar-collapse ul li a').click(function() {
        $('.navbar-toggle:visible').click();
    });

})(jQuery); // End of use strict
