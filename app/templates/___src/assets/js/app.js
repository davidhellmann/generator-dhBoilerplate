/**
 * Bundle Scripts
 */

// Vue Stuff

// Polyfills
import 'babel-polyfill'
import 'svgxuse'
// import 'eqcss'

// Scripts
import './scripts/example'
// import './scripts/pagetransition'
// import './scripts/preloader'
import './scripts/bodyclass'
import './scripts/lazyloading'
import './scripts/fontfaceobserver'
// import './scripts/smoothScroll'
// import './scripts/photoswipe'
// import './scripts/waypoints.anime'

<% if (projectUsage == 'Craft CMS' ) { %>
// Content Builder Modules
import '../../templates/_modules/_accordion/_accordion.script'
import '../../templates/_modules/_imageSlider/_imageSlider.script'
import '../../templates/_modules/_imageGallery/_imageGallery.script'
<% } %>

// Debugging
const _debug = false
window._debug = _debug

if (_debug === true) {
    console.log('Debugging is: true')
    const html = document.getElementsByTagName('html')[0]
    html.classList.add('dev', 'debug')
}

