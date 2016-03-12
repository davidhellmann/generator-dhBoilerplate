/**
 * ScrollMagic
 */

import $ from 'jquery'
import ScrollMagic from 'scrollmagic'
import animation from '../../../../node_modules/scrollmagic/scrollmagic/uncompressed/plugins/animation.gsap'
import debug from '../../../../node_modules/scrollmagic/scrollmagic/uncompressed/plugins/debug.addIndicators'

// ScrollMagic Controller
var controller = new ScrollMagic.Controller();

// ScrollMagic for fadeInUp Blocks

// Fade In Up Trigger
var fadeInUp_trigger = '.sm.fadeInUp';

if (fadeInUp_trigger) {
  $(fadeInUp_trigger).each(function(){

    // Fade In Up Tween
    var fadeInUp_tween = TweenMax.to(this, 1, {
      opacity: 1,
      transform: 'translate3d(0, 0, 0)',
      ease: Power4.easeOut
    })

    // Fade In Up Scence
    var fadeInUp_scene = new ScrollMagic.Scene({
      triggerElement: this,
      offset: -100,
      triggerHook: 0.5,
      //duration: 250
    })
      .reverse(true)
      .addIndicators({name: "triggerHook .9"})
      .setClassToggle('.block', "animated")
      .setTween(fadeInUp_tween)
      .addTo(controller);
  })
}
