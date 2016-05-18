/**
 * Set Body Classes
 */

// Body Class
var _body = document.querySelector('body');

setTimeout(function() {
  _body.classList.add('is_ready');
}, 0), setTimeout(function() {
  _body.classList.add('is_now_1000');
}, 1000), setTimeout(function() {
  _body.classList.add('is_now_2000');
}, 2000);
