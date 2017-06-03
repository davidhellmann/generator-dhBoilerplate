/**
 * Scroll to
 * use data-delay="100" or antoher number do set a timeout for the scrolling
 */

// Dependencies
import $ from 'jquery'
import debounce             from './lib/debounce'
import addListenerMulti     from './lib/addListenerMulti'


// Vars
const viewport = document
const body = document.body


// Click Event
$('a[href^="#"]').on('click', (event) => {
  console.log(this)

  const _target = $($(this).attr('href'))
  const _delay = $(this).attr('data-delay')

  if (_target.length) {
    event.preventDefault()

    if (_delay !== '') {
      setTimeout(() => {
        viewport.animate({
          scrollTop: _target.offset().top
        }, 500, () => {
          window.location.hash = _target.selector
        })
      }, _delay)
    } else {
      viewport.animate({
        scrollTop: _target.offset().top
      }, 500, () => {
        window.location.hash = _target.selector
      })
    }
  }
})


// Cancel when user Interact

addListenerMulti(viewport, 'scroll mousedown DOMMouseScroll mousewheel keyup touchmove', () => {
  viewport.stop()
})


// Debounce
const dh_windowScroll = debounce(() => {
  if ($(window).scrollTop() >= 100) {
    body.addClass('is_scrolled--100')
  } else {
    body.removeClass('is_scrolled--100')
  }
}, 500)

window.addEventListener('scroll', dh_windowScroll)
