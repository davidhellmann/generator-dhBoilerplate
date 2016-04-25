/**
 * Scroll to
 * use data-delay="100" or antoher number do set a timeout for the scrolling
 */

// Dependencies
import $ from 'jquery'
import debounce             from './debounce'



// Vars
var _viewport = $('html, body');



// Click Event
$('a[href^="#"]').on('click', function(event) {
  console.log(this);

  var _target = $( $(this).attr('href') );
  var _delay  = $(this).attr('data-delay');

  if( _target.length ) {
    event.preventDefault();

    if ( _delay != '' ) {

      setTimeout(function(){
        _viewport.animate({
          scrollTop: _target.offset().top
        }, 500, function () {
          window.location.hash = _target.selector;
        });
      }, _delay);

    } else {

      _viewport.animate({
        scrollTop: _target.offset().top
      }, 500, function () {
        window.location.hash = _target.selector;
      });

    }
  }
});



// Cancel when user Interact
_viewport.bind("scroll mousedown DOMMouseScroll mousewheel keyup touchmove", function(){
  _viewport.stop();
});



// Debounce
var dh_windowScroll = debounce(function() {
  var _body = $('body');

  if ($(window).scrollTop() >= 100 ) {

    _body.addClass('is_scrolled--100');

  } else {

    _body.removeClass('is_scrolled--100');

  }

}, 500);

window.addEventListener('scroll', dh_windowScroll);
