/**
 * Slick
 */

;(function($) {

  $('.slick').slick({
    infinite: false,
    dots: true,
    customPaging: function(slider, i) {
      // this example would render "tabs" with titles
      return '<span class="dot"></span>';
    },
    slidesToShow: 1,
    slidesToScroll: 1,
    prevArrow: '<span class="slickArrow slickArrow--prev"></span>',
    nextArrow: '<span class="slickArrow slickArrow--next"></span>',
  });

}(jQuery));