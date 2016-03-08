import config from '../../config.json';

const postCssConfig = () => {
  return [
    require('autoprefixer')({
      browsers: config.css.autoprefixer,
      cascade: false
    }),
    require('postcss-flexbugs-fixes')
  ]
}

module.exports = postCssConfig;
