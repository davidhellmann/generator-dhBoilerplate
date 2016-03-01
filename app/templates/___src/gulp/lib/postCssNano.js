import config from '../../config.json';

const postCSSNano = () => {
  return [
    require('cssnano')({
      zindex: false,
      discardUnused: false,
      reduceIndents: false,
      mergeIndents: false
    })
  ]
}

module.exports = postCSSNano;
