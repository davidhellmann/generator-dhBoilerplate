/**
 * Accordion
 * use data-next when the content follows direct to the triggger
 * use data-find (unique name) when the content is somewhere between the body tag
 */

;(function($) {

  var _trigger = $('[data-js="accordionTrigger"]');

  _trigger.on('click', function(event) {
    event.preventDefault();

    var _this = $(this);

    var _body = $('body');

    // Get Target
    var _next = _this.attr('data-next');
    var _find = _this.attr('data-find');

    // Get Wrapper
    var _wrapper = _this.attr('data-wrapper');

    // Get Status
    var _status = _this.attr('data-status');

    // Toggle Content
    if ( _status == 'closed') {

      _this.attr('data-status', 'open');

      // Check if next or find is set
      if (_next) {
        _this.next('[data-target="'+_next+'"]').attr('data-status', 'open').slideDown(250);
      } else {
        _body.find('[data-target="'+_find+'"]').attr('data-status', 'open').slideDown(250);
      }

      // Check if data-wrapper exist
      if (_wrapper) {
        _this.closest(_wrapper).attr('data-status', 'open');
      }

    } else {

      _this.attr('data-status', 'closed');

      // Check if next or find is set
      if (_next) {
        _this.next('[data-target="'+_next+'"]').attr('data-status', 'closed').slideUp(125);
      } else {
        _body.find('[data-target="'+_find+'"]').attr('data-status', 'closed').slideUp(125);
      }

      // Check if data-wrapper exist
      if (_wrapper) {
        _this.closest(_wrapper).attr('data-status', 'closed');
      }
    }

  });

}(jQuery));