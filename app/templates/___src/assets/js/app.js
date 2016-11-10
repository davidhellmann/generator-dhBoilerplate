/**
 * Bundle Scripts
 */

const _debug = true
window._debug = _debug

// Debugging
if (_debug === true) {
    console.log('Debugging is: true')
    const html = document.getElementsByTagName('html')[0]

    html.classList.add('dev',  'debug')
}

// Vendor
<% if (projectVue == true ) { %>
import Vue from 'vue'
import hello from './vue/_helloworld.vue'

new Vue({
    el: '#app',
    components: {
        hello
    }
})
<% } %>

// Personal
import './partials/example'
// import './partials/bodyclass'
// import './partials/cookies'
// import './partials/lazyloading'
// import './partials/scrollto'
// import './partials/pagetransition'
// import './partials/photoswipe'
// import './partials/matchHeight'
// import './partials/waypoints.anime'
