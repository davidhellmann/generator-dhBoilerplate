/**
 * Bundle Scripts
 */
<% if (projectVue) { %>
// Vue Stuff
// import './vue/vueExample'
<% } %>

// Polyfills
import 'babel-polyfill'
import 'svgxuse'

// Scripts
import './scripts/example'
// import './scripts/pagetransition'
// import './scripts/preloader'
import './scripts/bodyclass'
import './scripts/lazyloading'
import './scripts/fontfaceobserver'
// import './scripts/smoothScroll'
// import './scripts/waypoints.anime'

<% if (projectType !== 'wordpress' ) { %>
// Modules
import '../../templates/_modules/_accordion/_main'
import '../../templates/_modules/_cookiebar/_main'
import '../../templates/_modules/_contentToggle/_main'
import '../../templates/_modules/_imageSlider/_main'
import '../../templates/_modules/_imageGallery/_main'
<% } %>

// Debugging
const _debug = false
window._debug = _debug

if (_debug === true) {
    console.log('Debugging is: true')
    const html = document.getElementsByTagName('html')[0]
    html.classList.add('dev', 'debug')
}

