/**
 * Waypoints
 */

// Dependencies
import $ from 'jquery'
import TweenMax from '../../../../node_modules/gsap/src/uncompressed/TweenMax'
import waypoint from './vendor/jquery.waypoints'
import debounce             from './debounce'


// Find Blocks with .sm Element
const sm_blog_triggers = $('.js_waypointTrigger').has('.js_waypointElement');


// Waypoint Init
$(sm_blog_triggers).waypoint({
  handler(direction) {
    const waypointID = this.element.id
    const elements = $(this.element).find(`.js_waypointElement[data-waypoint-id="${waypointID}"]`);

    // Check if direction down
    if (direction === 'down') {
      // Fade In Up Settings
      TweenMax.staggerTo(elements, 0.5, {
        opacity: 1,
        transform: 'translate3d(0, 0, 0)',
        ease: Power2.easeOut,
        className: '+=' + 'is_animated'
      }, 0.15);

    }
  },
  offset: '90%'
})
