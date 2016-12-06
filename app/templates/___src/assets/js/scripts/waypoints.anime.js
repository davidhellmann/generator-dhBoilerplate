/**
 * Waypoints
 */

// Dependencies
import anime        from 'animejs'
import waypoints    from '../lib/waypoints.anime'


//  --------------------------------------------------------
//  Animation
//  --------------------------------------------------------

const fadeInUp = (els, delay) => {
  anime({
    targets: els,
    translateY: ['50', '0'],
    duration: 750,
    opacity: [0, 1],
    delay: delay,
    easing: 'easeOutBack',
    complete() {
      els.classList.add(fadeInUp.name)
    }
  })
}


const triggers = document.querySelectorAll('.js_waypointTrigger')
waypoints(triggers, fadeInUp, '90%')
