/* -------------------------------------------------- */
/*    Image Slider
 /* -------------------------------------------------- */

import Flickity from 'flickity'

// Load Resize Hack
window.addEventListener('load', () => {
    setTimeout(() => {
        const sliders = Array.from(document.querySelectorAll('.js-navCategories'))
        if (sliders) {
            sliders.forEach((slider) => {
                const flkty = Flickity.data(slider)
                flkty.resize()
                slider.classList.add('is-visible')
            })
        }
    }, 250)
})