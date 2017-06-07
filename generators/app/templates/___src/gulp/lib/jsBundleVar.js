import browserify from 'browserify'
import babelify from 'babelify'
<% if (projectVue === true ) { %>
import vueify from 'vueify'
import aliasify from 'aliasify'
<% } %>
import yargs from 'yargs'
import pkg from '../../package.json'

const argv = yargs.argv
const env = argv.env || 'development'

const bundleVar = () => {
  if(env == 'development') {
    return browserify(
      pkg.src.js + pkg.files.jsApp.srcName,
      {
        debug: true
      }
    )
        .transform(babelify.configure({ presets: ["es2015"]}))

        <% if (projectVue === true ) { %>
        .transform(aliasify,{
            aliases: {
                "vue": "./node_modules/vue/dist/vue.js"
            },
            verbose: true
        })
        .transform(vueify)
        <% } %>

  } else {
    return browserify(
        pkg.src.js + pkg.files.jsApp.srcName
    )
        .transform(babelify.configure({ presets: ["es2015"]}))

        <% if (projectVue === true ) { %>
        .transform(aliasify,{
            aliases: {
                "vue": "./node_modules/vue/dist/vue.js"
            },
            verbose: true
        })
        .transform(vueify)
        <% } %>

  }

  return bundler
}

module.exports = bundleVar
