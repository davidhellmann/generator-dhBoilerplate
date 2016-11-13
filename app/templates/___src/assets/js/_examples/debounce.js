/*
 * Debounce Function for Smart Resizing
 * */

// Returns a function, that, as long as it continues to be invoked, will not
// be triggered. The function will be called after it stops being called for
// N milliseconds. If `immediate` is passed, trigger the function on the
// leading edge, instead of the trailing.

const debounce = (func, wait, immediate) => {
  let timeout
  return function() {
    let context = this
    let args = arguments
    let later = function() {
      timeout = null
      if (!immediate) func.apply(context, args)
    }
    let callNow = immediate && !timeout
    clearTimeout(timeout)
    timeout = setTimeout(later, wait)
    if (callNow) func.apply(context, args)
  }
}

export default debounce


/**
 * Debounce Example
 */

/* var dh_windowResize = debounce(function() {
    // Debugging
    if (_debug === true) {
        console.log('Resizing')
    }
}, 500);

window.addEventListener('resize', dh_windowResize);*/
