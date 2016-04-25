/**
 * Page Transitions
 */

// Dependencies
import $ from 'jquery'



// Vars
var _siteURL = window.location.protocol + '//' + window.location.host;



// Click Event
$('a[href^="' + _siteURL + '"]:not([href*="#"])').on('click', function(e) {

  if(!(e.ctrlKey || e.metaKey || e.which == 2)){

    var newPage   = $(this).attr("href");

    e.preventDefault();

    // Set Transition Class
    $('body').addClass('js_pageTransition');

    // Go to New Page
    setTimeout(function(){
      goToUrl(newPage);
    }, 250);
  }

});

// Go to Url Function
function goToUrl(newPage) {
  window.location = newPage;
}



// Browser Back Fix
$(window).bind("pageshow", function(event) {
  if (event.originalEvent.persisted) {
    $('body').removeClass('js_pageTransition');
  }
});

