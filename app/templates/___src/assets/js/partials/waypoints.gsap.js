/**
 * Waypoints
 */

// Dependencies
import $ from 'jquery'
import TweenMax from '../../../../node_modules/gsap/src/uncompressed/TweenMax'
import waypoint from './vendor/jquery.waypoints'
import debounce             from './debounce'



// Find Blocks with .sm Element
var sm_blog_triggers = $('.js_waypointTrigger').has('.js_waypointElement');



// Waypoint Init
var waypoints = $(sm_blog_triggers).waypoint({
  handler: function(direction) {

    var waypointID = this.element.id;

    // Check if direction down
    if ( direction === 'down') {

      // Get all Child Elements with wayPointID
      var elements = $(this.element).find('.js_waypointElement[data-waypoint-id="' + waypointID + '"]');

      // Fade In Up Settings
      TweenMax.staggerTo(elements, .5, {
        opacity: 1,
        transform: 'translate3d(0, 0, 0)',
        ease: Power2.easeOut,
        className: '+=' + 'is_animated'
      }, 0.15);

    }
  },
  offset: '90%'
})
