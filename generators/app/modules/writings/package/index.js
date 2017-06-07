const logMessage = require('../../../helpers/messages/_logMessage')

// Stuff to build the package.json
const addBaseData = require('../../package/_base')
const addProjectSettings = require('../../package/_project')
const addBrowserlistSettings = require('../../package/_browserslist')
const addBrowserSyncSettings = require('../../package/_browserSync')
const addCriticalCSSSettings = require('../../package/_criticalCSS')
const addCSSSettings = require('../../package/_css')
const addDependencies = require('../../package/_dependencies')
const addDevDependencies = require('../../package/_devDependencies')
const addFaviconsSettings = require('../../package/_favicons')
const addSystemFiles = require('../../package/_sytemFiles')
const addInlineJSFiles = require('../../package/_inlineJS')
const addJquerySettings = require('../../package/_jquery')
const addMinifyImagesSettings = require('../../package/_minify')
const addModernizrSettings = require('../../package/_modernizr')
const addNPMScripts = require('../../package/_scripts')
const addVueJS = require('../../package/_vueJS')

// Src Paths
const addSrcPaths = require('../../package/_srcPaths')

// Dist Paths
const addDistPathsCraftCMS = require('../../package/_distPathsCraftCMS')
const addDistPathsCraftCMS3 = require('../../package/_distPathsCraftCMS3')
const addDistPathsPrototyping = require('../../package/_distPathsPrototyping')
const addDistPathsWordpress = require('../../package/_distPathsWordpress')

const writePackageJSON = () => {
    return {
        writing: (context) => {
            return new Promise((resolve) => {
                logMessage({message: 'Writing package.json'})

                // Getting the template files
                const pkg = context.fs.readJSON(context.templatePath('_package.json'), {})
                // Write Settings into packackge.json
                // Base Stuff
                addBaseData({pkg}, context)
                addProjectSettings({pkg}, context)

                // NPM Scripts
                addNPMScripts({pkg})

                // Paths
                addSrcPaths({pkg})
                if (context.props.projectType === 'craftCMS') {
                    addDistPathsCraftCMS({pkg})
                } else if (context.props.projectType === 'craftCMS3') {
                    addDistPathsCraftCMS3({pkg})
                } else if (context.props.projectType === 'prototyping') {
                    addDistPathsPrototyping({pkg})
                } else if (context.props.projectType === 'wordpress') {
                    addDistPathsWordpress({pkg})
                }

                // Files
                addSystemFiles({pkg})
                addInlineJSFiles({pkg})

                // Dependencies
                addDependencies({pkg})
                addDevDependencies({pkg})

                // If jQuery True
                if (context.props.projectJquery === true) {
                    addJquerySettings({pkg})
                }

                // If VueJS True
                if (context.props.projectVue === true) {
                    addVueJS({pkg})
                }

                // Project Settings
                addFaviconsSettings({pkg}, context)
                addMinifyImagesSettings({pkg})
                addModernizrSettings({pkg})
                addCriticalCSSSettings({pkg})
                addCSSSettings({pkg})
                addBrowserlistSettings({pkg})
                addBrowserSyncSettings({pkg}, context)

                // Write package.json
                context.fs.writeJSON(context.destinationPath('package.json'), pkg)

                resolve()
            })
        }
    }
}

module.exports = writePackageJSON
