/**
 * Layer
 */

// Dependencies
import $ from 'jquery'

// Open Layer Function
var openLayer = (layer) => {
  // Body
  var _body = $('body');

  _body.attr('data-status', 'layer-open');
  $('.fullLayer[data-layer="'+layer+'"]').fadeIn(500);
};


// Close Layer Function
var closeLayer = () => {
  // Body
  var _body = $('body');

  _body.attr('data-status', '');
  $('.fullLayer[data-layer]').fadeOut(250);
};


// Open Layer Trigger
var openTrigger = $('.js_fullLayerTrigger');
openTrigger.on('click', function(e) {
  e.preventDefault();

  // Layer
  var _layer = $(this).attr('data-layer');
  openLayer(_layer);
});


// Close Layer Trigger
var closeTrigger = $('.js_fullLayerTrigger__close');
closeTrigger.on('click', function(e) {
  e.preventDefault();
  closeLayer();
});


