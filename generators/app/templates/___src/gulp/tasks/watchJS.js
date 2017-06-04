import gulp from 'gulp'
import bundleJs from '../lib/jsBundle'
import browserify from 'browserify'
import watchify from 'watchify'
import babelify from 'babelify'
import merge from 'utils-merge'
<% if (projectVue == true ) { %>
import vueify from 'vueify'
import aliasify from 'aliasify'
import hmr from 'browserify-hmr'
<% } %>
import pkg from '../../package.json';

const watchJs = () => {
  const args = merge(watchify.args, {debug: true})
  const bundler = watchify(
    browserify(pkg.src.js + pkg.files.jsApp.srcName, args)
  )
  <% if (projectVue === true ) { %>
  .plugin(hmr)
  <% } %>
  .transform(
    babelify.configure({presets: ['es2015']})
  )
  <% if (projectVue === true ) { %>
  .transform(aliasify,{
    aliases: {
      "vue": "./node_modules/vue/dist/vue.js"
    },
    verbose: true
  })
  .transform(vueify)
  <% } %>

  bundleJs(bundler)

  bundler.on('update', function () {
    console.log('-> bundling...')
    bundleJs(bundler);
    console.log('Bundled JS Files')
  })
}

gulp.task('watch:js', watchJs)
module.exports = watchJs
