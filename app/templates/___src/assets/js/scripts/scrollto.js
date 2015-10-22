/**
 * Scroll to
 * use data-delay="100" or antoher number do set a timeout for the scrolling
 */

;(function($) {

  var _viewport = $('html, body');

  $('a[href^="#"]').on('click', function(event) {

    var _target = $( $(this).attr('href') );
    var _delay  = $(this).attr('data-delay');

    if( _target.length ) {
      event.preventDefault();

      if ( _delay != '' ) {

        setTimeout(function(){
          _viewport.animate({
            scrollTop: _target.offset().top
          }, 250);
        }, _delay);

      } else {

        _viewport.animate({
          scrollTop: _target.offset().top
        }, 250);

      }
    }
  });

  _viewport.bind("scroll mousedown DOMMouseScroll mousewheel keyup touchmove", function(){
    _viewport.stop();
  });

}(jQuery));



;(function($) {

  $(window).scroll(function() {

    var _topButton = $('.backToTop');

    if ($(window).scrollTop() >= 80 ) {

      _topButton.addClass('active');

    } else {

      _topButton.removeClass('active');

    }
  });

}(jQuery));