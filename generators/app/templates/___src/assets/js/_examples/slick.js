/**
 * Slick Slider
 */

// Dependencies
import $ from 'jquery'
import slickcarousel        from 'slick-carousel'


// Slick Init
$('.slick--photoSlider').slick({
  prevArrow: '<span class="slickArrow slickArrow--prev"></span>',
  nextArrow: '<span class="slickArrow slickArrow--next"></span>',
  dots: true,
  customPaging(slider, i) {
    // this example would render "tabs" with titles
    return '<span class="dot"></span>'
  },
  speed: 300,
  slidesToShow: 5,
  slidesToScroll: 1,
  centerMode: true,
  variableWidth: true,
  centerPadding: '100px',
  focusOnSelect: true,
  swipeToSlide: true,
  touchThreshold: 20,
  responsive: [
    {
      breakpoint: 1024,
      settings: {
        centerPadding: '60px',
        slidesToShow: 3
      }
    },
    {
      breakpoint: 667,
      settings: {
        arrows: false,
        centerPadding: '20px',
        slidesToShow: 1
      }
    }
  ]
})
