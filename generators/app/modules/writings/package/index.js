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
const addSystemFiles = require('../../package/_files')
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

                // Settings
                context.addBaseData = addBaseData.bind(context)
                context.addProjectSettings = addProjectSettings.bind(context)
                context.addBrowserlistSettings = addBrowserlistSettings.bind(context)
                context.addBrowserSyncSettings = addBrowserSyncSettings.bind(context)
                context.addCriticalCSSSettings = addCriticalCSSSettings.bind(context)
                context.addCSSSettings = addCSSSettings.bind(context)
                context.addDependencies = addDependencies.bind(context)
                context.addDevDependencies = addDevDependencies.bind(context)
                context.addFaviconsSettings = addFaviconsSettings.bind(context)
                context.addSystemFiles = addSystemFiles.bind(context)
                context.addInlineJSFiles = addInlineJSFiles.bind(context)
                context.addJquerySettings = addJquerySettings.bind(context)
                context.addMinifyImagesSettings = addMinifyImagesSettings.bind(context)
                context.addModernizrSettings = addModernizrSettings.bind(context)
                context.addNPMScripts = addNPMScripts.bind(context)
                context.addVueJS = addVueJS.bind(context)

                // Src Paths
                context.addSrcPaths = addSrcPaths.bind(context)

                // Dist Paths
                context.addDistPathsCraftCMS = addDistPathsCraftCMS.bind(context)
                context.addDistPathsCraftCMS3 = addDistPathsCraftCMS3.bind(context)
                context.addDistPathsPrototyping = addDistPathsPrototyping.bind(context)
                context.addDistPathsWordpress = addDistPathsWordpress.bind(context)

                // Write Settings into packackge.json

                // Base Stuff
                context.addBaseData({pkg})
                context.addProjectSettings({pkg})

                // NPM Scripts
                context.addNPMScripts({pkg})

                // Paths
                context.addSrcPaths({pkg})
                if (context.props.projectType === 'craftCMS') {
                    context.addDistPathsCraftCMS({pkg})
                } else if (context.props.projectType === 'craftCMS3') {
                    context.addDistPathsCraftCMS3({pkg})
                } else if (context.props.projectType === 'prototyping') {
                    context.addDistPathsPrototyping({pkg})
                } else if (context.props.projectType === 'wordpress') {
                    context.addDistPathsWordpress({pkg})
                }

                // Files
                context.addSystemFiles({pkg})
                context.addInlineJSFiles({pkg})

                // Dependencies
                context.addDependencies({pkg})
                context.addDevDependencies({pkg})

                // If jQuery True
                if (context.props.projectJquery === true) {
                    context.addJquerySettings({pkg})
                }

                // If VueJS True
                if (context.props.projectVue === true) {
                    context.addVueJS({pkg})
                }

                // Project Settings
                context.addFaviconsSettings({pkg})
                context.addMinifyImagesSettings({pkg})
                context.addModernizrSettings({pkg})
                context.addCriticalCSSSettings({pkg})
                context.addCSSSettings({pkg})
                context.addBrowserlistSettings({pkg})
                context.addBrowserSyncSettings({pkg})

                // Write package.json
                context.fs.writeJSON(context.destinationPath('package.json'), pkg)

                resolve()
            })
        }
    }
}

module.exports = writePackageJSON
