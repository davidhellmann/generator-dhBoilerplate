/**
 * Page Transitions
 */

// Dependencies
import goToUrl from '../lib/goToUrl'
import Velocity from 'velocity-animate'

// Vars
const body = document.body
const siteURL = `${window.location.protocol}//${window.location.host}`
const triggers = Array.from(document.querySelectorAll(`a[href^="${siteURL}"]:not([href*="#"])`))

triggers.forEach((trigger) => {
    // Click Event
    let dragged = 0
    trigger.addEventListener('mousedown', function() {
        dragged = 0
    }, false)
    trigger.addEventListener('mousemove', function() {
        dragged = 1
    }, false)
    trigger.addEventListener('mouseup', function(event) {
        if (dragged === 0) {
            if (!(event.ctrlKey || event.metaKey || event.which === 2)) {
                const newLocation = this.getAttribute('href')
                event.preventDefault()
                console.log('test')

                // Set Transition Class
                body.classList.add('js-pageTransition')
                Velocity(document.body, 'scroll', { duration: 250 }, 'easeOutCubic')

                // Go to New Page
                setTimeout(() => {
                    goToUrl(newLocation)
                }, 250)
            }
        }
    }, false)
})

window.onpageshow = (event) => {
    if (event.persisted) {
        body.classList.remove('js-pageTransition')
    }
}
