/**
 * Accordion
 */

import Velocity from 'velocity-animate'

// Config
const cfg = {
  body: document.body,
  triggers: Array.from(document.querySelectorAll('.js_accordionTrigger')),
  up: 'slideUp',
  down: 'slideDown',
  status: 'is_open'
}

const init = () => {
  cfg.triggers.forEach((trigger) => {
    trigger.addEventListener('click', function(event){
      event.preventDefault()
      const accContent = this.nextElementSibling

      if(!this.classList.contains(cfg.status)) {
        this.classList.add(cfg.status)
        Velocity(accContent, cfg.down, { duration: 250 }, 'easeOutCubic')
      } else {
        this.classList.remove(cfg.status)
        Velocity(accContent, cfg.up, { duration: 125 }, 'easeOutCubic')
      }
    })
  })
}

init()
