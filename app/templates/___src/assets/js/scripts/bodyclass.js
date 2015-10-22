/**
 * Set Body Classes
 */

;(function($) {
  setTimeout(function() {
    $('body').addClass('is_ready');
  }, 0), setTimeout(function() {
    $('body').addClass('is_now_1000');
  }, 1000), setTimeout(function() {
    $('body').addClass('is_now_2000');
  }, 2000);

}(jQuery));