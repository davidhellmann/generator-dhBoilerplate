import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import browserify from 'browserify';
import babelify from 'babelify';
import yargs from 'yargs';

const argv = yargs.argv;

const env = argv.env || 'development'

const bundleVar = () => {
  if(env == 'development') {
    return browserify(
      config.src.js + config.files.jsApp.srcName,
      {
        debug: true
      }
    )
      .transform(babelify.configure({ presets: ["es2015"]}))
  } else {
    return browserify(
      config.src.js + config.files.jsApp.srcName
    )
      .transform(babelify.configure({ presets: ["es2015"]}))
  }

  return bundler
}

module.exports = bundleVar;
