/* -------------------------------------------------- */
/*    Image Slider
/* -------------------------------------------------- */

import Flickity from 'flickity'

// Load Resize Hack
window.addEventListener('load', () => {
    setTimeout(() => {
        const sliders = Array.from(document.querySelectorAll('.js-imageSlider'))
        if (sliders) {
            sliders.forEach((slider) => {
                const flkty = Flickity.data(slider)
                flkty.resize()
                slider.classList.add('is-visible')
            })
        }
    }, 250)
})

/*const flktySettings = {
    cellAlign: 'left',
    contain: true,
    draggable: true,
    friction: 1,
    lazyLoad: 2,
    selectedAttraction: 0.1,
    groupCells: true,
    setGallerySize: false,
    imagesLoaded: true,
    prevNextButtons: true,
    pageDots: true,
    wrapAround: true,
    //watchCSS: true
}

const stageImageSliders = Array.from(document.querySelectorAll('.js-imageSlider'))

if (stageImageSliders) {

    stageImageSliders.forEach((slider) => {
        const flkty = new Flickity(slider, flktySettings)
        const buttonHolder = slider.parentNode

        // Previous Button
        const prevButton = buttonHolder.querySelector('.m-imageSlider__button--prev')
        if (prevButton) {
            prevButton.addEventListener('click', function() {
                flkty.previous()
            })
        }

        // Next Button
        const nextButton = buttonHolder.querySelector('.m-imageSlider__button--next')
        if (nextButton) {
            nextButton.addEventListener('click', function() {
                flkty.next()
            })
        }

        flkty.on( 'select', function() {
            const slideCount = flkty.slides.length
            // enable/disable previous/next buttons
            if ( flkty.selectedIndex === 0 ) {
                // on first cell
                prevButton.classList.add('is-inActive')
            } else if ( slideCount - flkty.selectedIndex === 1 ) {
                // on last cell
                nextButton.classList.add('is-inActive')
            } else {
                prevButton.classList.remove('is-inActive')
                nextButton.classList.remove('is-inActive')
            }
        })

        window.addEventListener( 'load', function() {
            setTimeout(() => {
                flkty.resize()
            }, 100)
        })
    })
}*/
