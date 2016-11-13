/**
 * Accordion
 * use data-next when the content follows direct to the triggger
 * use data-find (unique name) when the content is somewhere between the body tag
 */

// Dependencies
import $ from 'jquery'


// Vars
let _trigger = $('.js_accordionTrigger');


// Click Event
_trigger.addEventListener('click', (event) function(event) {
  event.preventDefault();

  let _this = $(this);

  let _body = $('body');

  // Get Target
  let _next = _this.attr('data-next');
  let _find = _this.attr('data-find');

  // Get Wrapper
  let _wrapper = _this.attr('data-wrapper');

  // Get Status
  let _status = _this.attr('data-status');

  // Toggle Content
  if ( _status == 'closed') {

    _this.attr('data-status', 'open');

    // Check if next or find is set
    if (_next) {
      _this.next('[data-target="'+_next+'"]')
      .attr('data-status', 'open')
      .slideDown(250);
    } else {
      _body.find('[data-target="'+_find+'"]')
      .attr('data-status', 'open')
      .slideDown(250);
    }

    // Check if data-wrapper exist
    if (_wrapper) {
      _this.closest(_wrapper)
      .attr('data-status', 'open');
    }

  } else {

    _this.attr('data-status', 'closed');

    // Check if next or find is set
    if (_next) {
      _this.next('[data-target="'+_next+'"]')
      .attr('data-status', 'closed').slideUp(250);
    } else {
      _body.find('[data-target="'+_find+'"]')
      .attr('data-status', 'closed').slideUp(250);
    }

    // Check if data-wrapper exist
    if (_wrapper) {
      _this.closest(_wrapper)
      .attr('data-status', 'closed');
    }
  }

}, false);
