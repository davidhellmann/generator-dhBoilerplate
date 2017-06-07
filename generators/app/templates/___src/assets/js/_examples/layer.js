/**
 * Layer
 */

// Dependencies
import $ from 'jquery'

const _body = document.body

// Open Layer Function
const openLayer = (layer) => {
  _body.attr('data-status', 'layer-open')
  $(`.fullLayer[data-layer="${layer}"]`).fadeIn(500)
}


// Close Layer Function
const closeLayer = () => {
  _body.attr('data-status', '')
  $('.fullLayer[data-layer]').fadeOut(250)
}


// Open Layer Trigger
const openTrigger = $('.js_fullLayerTrigger')
openTrigger.on('click', (e) => {
  e.preventDefault()

  // Layer
  const _layer = $(this).attr('data-layer')
  openLayer(_layer)
})


// Close Layer Trigger
const closeTrigger = $('.js_fullLayerTrigger__close')
closeTrigger.on('click', (e) => {
  e.preventDefault()
  closeLayer()
})
