/**
 * Toogle Content
 */

import Velocity from 'velocity-animate'

// Config
const cfg = {
    body: document.body,
    triggers: Array.from(document.querySelectorAll('.js-contentToggle')),
    triggersTop: Array.from(document.querySelectorAll('.js-contentToggle--top')),
    up: 'slideUp',
    down: 'slideDown',
    status: 'is-open'
}

const init = () => {
    const mergedTriggers = cfg.triggers.concat(cfg.triggersTop)

    mergedTriggers.forEach((trigger) => {
        trigger.addEventListener('click', function(event) {
            event.preventDefault()
            const contentBottom = this.nextElementSibling
            const contentTop = this.previousElementSibling
            const textOpen = this.getAttribute('data-text-open')
            const textclosed = this.getAttribute('data-text-closed')
            const textHolder = this.querySelector('.js-textHolder')

            let content
            if(this.classList.contains('js-contentToggle')) {
                content = contentBottom
            } else {
                content = contentTop
            }

            if (!this.classList.contains(cfg.status)) {
                this.classList.add(cfg.status)
                Velocity(content, cfg.down, {
                    duration: 250,
                    complete() {
                        content.classList.add('fadeIn')
                        textHolder.innerHTML=textOpen
                    },
                }, 'easeOutCubic')
            } else {
                this.classList.remove(cfg.status)
                Velocity(content, cfg.up, {
                    duration: 125,
                    complete() {
                        content.classList.remove('fadeIn')
                        textHolder.innerHTML=textclosed
                    },
                }, 'easeOutCubic')
            }
        })
    })
}

init()
