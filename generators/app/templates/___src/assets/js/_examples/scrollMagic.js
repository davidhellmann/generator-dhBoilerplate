/**
 * ScrollMagic
 */

// Dependencies
import $ from 'jquery'
import ScrollMagic from 'scrollmagic'
import TweenMax from '../../../../node_modules/gsap/src/uncompressed/TweenMax'
import animation from '../../../../node_modules/scrollmagic/scrollmagic/uncompressed/plugins/animation.gsap'
//import debug from '../../../../node_modules/scrollmagic/scrollmagic/uncompressed/plugins/debug.addIndicators'

// ScrollMagic Controller
var controller = new ScrollMagic.Controller();

// Find Blocks with .sm Element
const sm_blog_triggers = $('.block, .smWrapper, .workList').has('.sm')

$(sm_blog_triggers).each(function triggers() {
  // Fade In Up Settings
  if ($(this).has('.fadeInUp, .fadeInDown, .fadeInRight, .fadeInLeft')) {
    const sm_tween = TweenMax.staggerTo($(this).find('.sm'), 0.5, {
      opacity: 1,
      transform: 'translate3d(0, 0, 0) scale(1)',
      ease: Power2.easeOut,
      className: '+=' + 'is_animated'
    }, 0.15)
  }

  // Scene
  const sm_scence = new ScrollMagic.Scene({
    triggerElement: this,
    offset: 0,
    triggerHook: 0.8,
    //duration: 250
  })
    .reverse(true)
    //.addIndicators({name: "default"})
    .setTween(sm_tween)
    .addTo(controller)

})
