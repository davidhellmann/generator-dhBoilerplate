import config from '../../config.json';

const postCssConfig = () => {
  return [
    // Add :matches Selector
    require('postcss-selector-matches'),

    // Include Assets
    require('postcss-assets')({
      basePath: config.dist.markup,
      loadPaths: [config.dist.images.base]
    }),

    // Prefixer
    require('autoprefixer')({
      browsers: config.css.autoprefixer,
      cascade: false
    }),

    // Inline SVG Images
    require('postcss-svg')({
      defaults: '[fill]:#f00',
      paths: [config.dist.images.svg.single]
    }),

    // Include Size Short hands
    require('postcss-short-size'),

    // Fix some Flexbox Bugs
    require('postcss-flexbugs-fixes')
  ]
}

module.exports = postCssConfig;
