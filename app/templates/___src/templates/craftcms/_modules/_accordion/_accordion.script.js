/* -------------------------------------------------- */
/*    Accordion Label
 /* -------------------------------------------------- */

/**
 * Accordion
 */

import Velocity from 'velocity-animate'

// Config
const cfg = {
    body: document.body,
    triggers: Array.from(document.querySelectorAll('.js-accordionTrigger')),
    up: 'slideUp',
    down: 'slideDown',
    status: 'is-open'
}
const init = () => {
    cfg.triggers.forEach((trigger) => {
        trigger.addEventListener('click', function(event) {
            event.preventDefault()
            const accContent = this.nextElementSibling
            if (!this.classList.contains(cfg.status)) {
                this.classList.add(cfg.status)
                Velocity(accContent, cfg.down, {
                    duration: 250,
                    complete() {
                        accContent.classList.add('fadeIn')
                    },
                }, 'easeOutCubic')
            } else {
                this.classList.remove(cfg.status)
                Velocity(accContent, cfg.up, {
                    duration: 125,
                    complete() {
                        accContent.classList.remove('fadeIn')
                    },
                }, 'easeOutCubic')
            }
        })
    })
}
init()
