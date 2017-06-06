const logMessage = require('../../../helpers/messages/_logMessage')

// Stuff to build the package.json
const browserlistJson = require('../../../modules/writings/_browserslist.json')
const browserSyncJson = require('../../../modules/writings/_browserSync.json')
const criticalCSSJson = require('../../../modules/writings/_criticalCSS.json')
const cssJson = require('../../../modules/writings/_css.json')
const dependenciesJson = require('../../../modules/writings/_dependencies.json')
const devDependenciesJson = require('../../../modules/writings/_devDependencies.json')
const faviconsJson = require('../../../modules/writings/_favicons.json')
const filesJson = require('../../../modules/writings/_files.json')
const inlineJSJson = require('../../../modules/writings/_inlineJS.json')
const jqueryJson = require('../../../modules/writings/_jquery.json')
const minifyJson = require('../../../modules/writings/_minify.json')
const modernizrJson = require('../../../modules/writings/_modernizr.json')
const scriptsJson = require('../../../modules/writings/_scripts.json')
const vueJSJson = require('../../../modules/writings/_vueJS.json')

const writePackageJson = () => {
    return {
        writing: (context) => {
            return new Promise((resolve) => {
                logMessage({ message: 'Writing package.json' })

                // Getting the template files
                const pkg = context.fs.readJSON(context.templatePath('_package.json'), {})

                // Settings
                context.browserlistJson = browserlistJson.bind(context)
                context.browserSyncJson = browserSyncJson.bind(context)
                context.criticalCSSJson = criticalCSSJson.bind(context)
                context.cssJson = cssJson.bind(context)
                context.dependenciesJson = dependenciesJson.bind(context)
                context.devDependenciesJson = devDependenciesJson.bind(context)
                context.faviconsJson = faviconsJson.bind(context)
                context.filesJson = filesJson.bind(context)
                context.inlineJSJson = inlineJSJson.bind(context)
                context.jqueryJson = jqueryJson.bind(context)
                context.minifyJson = minifyJson.bind(context)
                context.modernizrJson = modernizrJson.bind(context)
                context.scriptsJson = scriptsJson.bind(context)
                context.vueJSJson = vueJSJson.bind(context)

                // Write Settings into packackge.json
                context.basePackageJson({ pkg })
                context.browserlistJson({ pkg })
                context.browserSyncJson({ pkg })
                context.criticalCSSJson({ pkg })
                context.cssJson({ pkg })
                context.dependenciesJson({ pkg })
                context.devDependenciesJson({ pkg })
                context.faviconsJson({ pkg })
                context.filesJson({ pkg })
                context.inlineJSJson({ pkg })
                context.minifyJson({ pkg })
                context.modernizrJson({ pkg })
                context.scriptsJson({ pkg })
                context.srcPathsJson({ pkg })

                // If jQuery True
                if (context.props.projectJquery === true) {
                    context.jqueryJson({ pkg })
                }

                // If VueJS True
                if (context.props.projectVue === true) {
                    context.vueJSJson({ pkg })
                }

                // Write Dist Paths
                if (context.props.projectType === 'craftCMS') {
                    context.distPathsCraftCMSJson({ pkg })
                } else if (context.props.projectType === 'craftCMS3') {
                    context.distPathsCraftCMS3Json({ pkg })
                } else if (context.props.projectType === 'prototyping') {
                    context.distPathsPrototypingJson({ pkg })
                } else if (context.props.projectType === 'wordpress') {
                    context.distPathsWordpressJson({ pkg })
                }

                // Write package.json
                context.fs.writeJSON(context.destinationPath('package.json'), pkg)

                resolve()
            })
        }
    }
}

module.exports = writePackageJson
