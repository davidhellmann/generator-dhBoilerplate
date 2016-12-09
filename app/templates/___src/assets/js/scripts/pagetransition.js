/**
 * Page Transitions
 */

// Dependencies
import goToUrl from '../lib/goToUrl'


// Vars
const body = document.body
const siteURL = `${window.location.protocol}//${window.location.host}`
const triggers = Array.from(document.querySelectorAll(`a[href^="${siteURL}"]:not([href*="#"])`))


triggers.forEach((trigger) => {
  // Click Event
  trigger.addEventListener('click', function(event) {
    if (!(event.ctrlKey || event.metaKey || event.which === 2)) {
      const newLocation = this.getAttribute('href')
      event.preventDefault()

      // Set Transition Class
      body.classList.add('js_pageTransition')

      // Go to New Page
      setTimeout(() => {
        goToUrl(newLocation)
      }, 250)
    }
  }, false)
})



window.onpageshow = (event) => {
  if (event.persisted) {
    body.classList.remove('js_pageTransition')
  }
}
