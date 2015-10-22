/**
 * Pace
 */
 
;(function($) {

  paceOptions = {
    elements: {
      selectors: ['.websiteWrapper']
    }
  }

  Pace.on('done', function(){

    $('.websiteWrapper').addClass('is_visible');
    $('.cssload-loader').fadeOut(1500);

  });

})(jQuery);