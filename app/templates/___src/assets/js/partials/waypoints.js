/**
 * Waypoints
 */

// Dependencies
import $ from 'jquery'
import TweenMax from '../../../../node_modules/gsap/src/uncompressed/TweenMax'
import waypoint from './vendor/jquery.waypoints'


// Find Blocks with .sm Element
var sm_blog_triggers = $('.js_waypointTrigger').has('.js_waypointElement');


// Waypoint Init
var waypoints = $(sm_blog_triggers).waypoint({
  handler: function(direction) {

    // debugging
    console.log(direction, this.element);

    // Check if direction down
    if ( direction === 'down') {

      // Fade In Up Settings
      TweenMax.staggerTo($(this.element).find('.js_waypointElement'), .5, {
        opacity: 1,
        transform: 'translate3d(0, 0, 0)',
        ease: Power2.easeOut,
        className: '+=' + 'is_animated'
      }, 0.15);

    }
  },
  offset: '90%'
})
