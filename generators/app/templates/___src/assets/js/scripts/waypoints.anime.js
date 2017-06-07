/**
 * Waypoints
 */

// Dependencies
import '../vendor/waypoints'
import anime        from 'animejs'
import _throttle    from 'lodash/throttle'


//  --------------------------------------------------------
//  Animation
//  --------------------------------------------------------


// Find Blocks with .sm Element
const triggers = document.querySelectorAll('.js-waypointTrigger')

export function initWaypoints(els) {

    els.forEach((el) => {
        // New Waypoint
        new Waypoint({
            element: el,
            handler: function (direction) {
                // console.log('Triggered')
                //console.log(this.element);

                const waypointID = this.element.id

                // Check if direction down
                if (direction === 'down') {
                    const fadeInUp = (els, delay) => {
                        anime({
                            targets: els,
                            translateY: ['100', '0'],
                            duration: 750,
                            opacity: [0, 1],
                            delay: delay,
                            easing: 'easeOutBack',
                            complete() {
                                els.classList.add('is-animated')
                            }
                        })
                    }

                    // Get all Child Elements with wayPointID
                    var elements = this.element.querySelectorAll(`[data-waypoint-id="${waypointID}"]`)

                    for (var i = 0; i < elements.length; i++) {
                        var obj = elements[i];
                        var delay = 80 * i;

                        if (!obj.classList.contains('is-animeted')) {

                            if (obj.classList.contains('m-fadeInUp')) {
                                fadeInUp(obj, delay);
                                obj.classList.add('is-animeted');
                            }
                        }
                    }
                }
            },
            offset: '70%'
        })
    })
}

initWaypoints(triggers)

const refreshWaypoints = _throttle(() => {
    Waypoint.refreshAll()
}, 250)

window.addEventListener('resize', refreshWaypoints)
