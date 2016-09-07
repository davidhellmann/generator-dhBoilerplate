import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import browserify from 'browserify';
import babelify from 'babelify';
import vueify from 'vueify';
import aliasify from 'aliasify';
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
        .transform(aliasify,{
            aliases: {
                "vue": "./node_modules/vue/dist/vue.js"
            },
            verbose: true
        })
        .transform(vueify)
  } else {
    return browserify(
        config.src.js + config.files.jsApp.srcName
    )
        .transform(babelify.configure({ presets: ["es2015"]}))
        .transform(aliasify,{
            aliases: {
                "vue": "./node_modules/vue/dist/vue.js"
            },
            verbose: true
        })
        .transform(vueify)
  }

  return bundler
}

module.exports = bundleVar;
