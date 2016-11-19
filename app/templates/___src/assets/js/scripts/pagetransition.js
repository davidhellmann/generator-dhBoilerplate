/**
 * Page Transitions
 */

// Dependencies
import goToUrl from './lib/goToUrl'


// Vars
const body = document.body
const siteURL = `${window.location.protocol}//${window.location.host}`
const trigger = document.querySelector(`a[href^="${siteURL}"]:not([href*="#"])`)


// Click Event
trigger.addEventListener('click', (event) => {
  const _self = event.target
  if (!(event.ctrlKey || event.metaKey || event.which === 2)) {
    const newLocation = _self.getAttribute('href')

    event.preventDefault()

    // Set Transition Class
    body.classList.add('js_pageTransition')

    // Go to New Page
    setTimeout(() => {
      goToUrl(newLocation)
    }, 250)
  }
}, false)


window.onpageshow = (event) => {
  if (event.persisted) {
    body.classList.remove('js_pageTransition')
  }
}
