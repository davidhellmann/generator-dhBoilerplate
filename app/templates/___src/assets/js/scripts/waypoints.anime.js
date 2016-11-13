/**
 * Waypoints
 */

// Dependencies
import anime        from 'animejs'
import waypoint     from './vendor/waypoints'
import _throttle    from 'lodash/throttle'


const _triggers = document.querySelectorAll('.js_waypointTrigger')

// Check Triggers
const checkTriggers = (els) => {
    // Create Set to Store Triggers
    let _set = new Set()


    // Loop through all triggers
    for (let i = 0; i < els.length; i++) {
        const _self = els[i]
        const triggers = els[i].querySelector('.js_waypointElement') !== null

        // Check if childs wp Elements exists
        if (triggers) {
            _set.add(_self)
        }
    }

    let _triggersToUse = Array.from(_set)
    return _triggersToUse
}


// Animation
const fadeInUp = (els, delay) => {
    anime({
        targets:    els,
        translateY: ['50', '0'],
        duration:   750,
        opacity:    [0, 1],
        delay:      delay,
        easing:     'easeOutBack',
        complete:   function () {
            els.classList.add(fadeInUp.name);
        }
    })
}



// Waypoints
const waypoints = (els, ani, offset) => {
    els.forEach(function (el) {

        let _self = el

        _self = new Waypoint({

            element: _self,
            handler: function(direction) {

                // Set Waypoint ID
                let waypointID = _self.element.getAttribute('data-waypoint-id')

                // Check if direction == down
                if (direction === 'down' && !_self.element.classList.contains('is_triggered')) {
                    _self.element.classList.add('is_triggered')

                    // Get all Child Elements with wayPointID
                    let elements = _self.element.querySelectorAll(`.js_waypointElement[data-waypoint-id="${waypointID}"]`)

                    for (let i = 0; i < elements.length; i++) {
                        let obj   = elements[i];
                        let delay = 80 * i;


                        if (!obj.classList.contains('is_anime')) {
                            if (obj.classList.contains(ani.name)) {

                                fadeInUp(obj, delay);

                                obj.classList.add('is_anime');

                                console.log(obj)
                            }
                        }
                    }

                }
            },
            offset: offset
        })

    })
}

const triggersToUse = checkTriggers(_triggers)
waypoints(triggersToUse, fadeInUp, '90%')



// Throttling
const refreshWaypoints = _throttle(() => {
    Waypoint.refreshAll()
}, 1000)

window.addEventListener('resize', refreshWaypoints)
