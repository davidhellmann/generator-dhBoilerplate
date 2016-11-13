//  --------------------------------------------------------
//  Waypoints with AnimeSJ
//  --------------------------------------------------------


import waypoint     from './vendor/waypoints'
import _throttle    from 'lodash/throttle'



//  --------------------------------------------------------
//  Waypoints with Waypoint ID
//  --------------------------------------------------------

const waypoints = (elements, ani, offset) => {
    // Check Triggers
    const els = checkTriggers(elements)

    els.forEach((el) => {
        // This
        let self = el

        // New Waypoint
        self = new Waypoint({

            // Set Element
            element: self,
            handler: function(direction) {
                // Set Waypoint ID
                const waypointID = self.element.getAttribute('data-waypoint-id')

                // Check if direction === down and not triggered
                if (direction === 'down' && !self.element.classList.contains('is_triggered')) {
                    self.element.classList.add('is_triggered')

                    // Get all Child Elements with wayPointID
                    const elements = self.element.querySelectorAll(`[data-waypoint-id="${waypointID}"]`)

                    for (let i = 0; i < elements.length; i++) {
                        let obj   = elements[i]
                        let delay = 80 * i

                        if (!obj.classList.contains('is_anime')) {
                            if (obj.classList.contains(ani.name)) {
                                fadeInUp(obj, delay)
                                obj.classList.add('is_anime')
                            }
                        }
                    }

                }
            },
            offset: offset
        })
    })
}

export default waypoints


//  --------------------------------------------------------
//  Check Triggers
//  --------------------------------------------------------

const checkTriggers = (els) => {
    // Create Set to Store Triggers
    let _set = new Set()

    // Loop through all triggers
    for (let i = 0; i < els.length; i++) {
        const _self = els[i]
        const triggers = els[i].querySelector(`[data-waypoint]`) !== null

        // Check if childs wp Elements exists
        if (triggers) {
            _set.add(_self)
        }
    }

    let _triggersToUse = Array.from(_set)
    return _triggersToUse
}



//  --------------------------------------------------------
//  Refresh Waypoints on Resize with throttle
//  --------------------------------------------------------

const refreshWaypoints = _throttle(() => {
    Waypoint.refreshAll()
}, 1000)

window.addEventListener('resize', refreshWaypoints)
