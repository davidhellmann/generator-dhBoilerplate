/**
 * Layer
 */

;(function($) {

  var _trigger = $('[data-js="fullLayer"]');

  _trigger.on('click', function(e) {
    e.preventDefault();

    // Layer
    var _layer = $(this).attr('data-layer');

    openLayer(_layer);
  });

}(jQuery));


/**
 * Close Layer
 */

;(function($) {

  var _trigger = $('[data-js="fullLayer__close"]');

  _trigger.on('click', function(e) {
    e.preventDefault();

    closeLayer();
  });

}(jQuery));


/**
 * Functions
 */


// Open Layer
function openLayer(layer) {
  // Body
  var _body = $('body');

  _body.attr('data-status', 'layer-open');
  $('.fullLayer[data-layer="'+layer+'"]').fadeIn(500);
}

// Close Layer
function closeLayer() {
  // Body
  var _body = $('body');

  _body.attr('data-status', '');
  $('.fullLayer[data-layer]').fadeOut(250);
}