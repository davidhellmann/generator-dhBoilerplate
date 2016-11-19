/**
 * jQuery Match Height
 */

// Dependencies
import $ from 'jquery'
import matchheight          from 'jquery-match-height'

const trigger = document.querySelector('.js_matchHeight')

// MatchHeight with Timeout
setTimeout(() => {
  trigger.matchHeight()
}, 2500)
