/**
 * Waypoints
 */

// Dependencies
import $ from 'jquery'
import anime from 'animejs'
import waypoint from './vendor/jquery.waypoints'
import debounce             from './debounce'


// Find Blocks with .sm Element
var sm_blog_triggers = $('.js_waypointTrigger').has('.js_waypointElement');


// Waypoint Init
var waypoints = $(sm_blog_triggers).waypoint({
    handler: function (direction) {

        var waypointID = this.element.id;

        // Check if direction down
        if (direction === 'down') {

            var fadeInUp = function (els, delay) {
                anime({
                    targets:    els,
                    translateY: ['50', '0'],
                    duration:   750,
                    opacity:    [0, 1],
                    delay:      delay,
                    easing:     'easeOutBack',
                    complete:   function () {
                        els.classList.add('is_animated');
                    }
                })
            }


            // Get all Child Elements with wayPointID
            var elements = this.element.querySelectorAll('.js_waypointElement[data-waypoint-id="' + waypointID + '"]');

            for (var i = 0; i < elements.length; i++) {
                var obj   = elements[i];
                var delay = 80 * i;

                if (!obj.classList.contains('is_anime')) {
                    if (obj.classList.contains('fadeInUp')) {
                        fadeInUp(obj, delay);
                        obj.classList.add('is_anime');
                    }
                }
            }
        }
    },
    offset:  '90%'
})


// Debounce
var dh_windowResize = debounce(function () {
    Waypoint.refreshAll();
}, 250);

window.addEventListener('resize', dh_windowResize);
