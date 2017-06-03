/*
 const util = require('util')
 const path = require('path')
 const mkdirp = require('mkdirp')
 const commandExists = require('command-exists')
 const clear = require('clear-terminal')
 const extend = require('extend')
 */


const Generator = require('yeoman-generator')
const chalk = require('chalk')
const yosay = require('yosay')
const clear = require('clear-terminal')
const Pleasent = require('pleasant-progress')

const progress = new Pleasent()

// Importing Modules
// Default
const promptsFunction = require('./modules/_prompts')
const branding = require('./helpers/prompts/_branding')
const basePackageJson = require('./modules/writing/_package.json')

// Src Paths
const srcPathsJson = require('./modules/writing/_srcPaths.json')

// Dist Paths
const distPathsCraftCMSJson = require('./modules/writing/_distPathsCraftCMS.json')
const distPathsCraftCMSBetaJson = require('./modules/writing/_distPathsCraftCMSBeta.json')
const distPathsPrototypingJson = require('./modules/writing/_distPathsPrototyping.json')
const distPathsWordpressJson = require('./modules/writing/_distPathsWordpress.json')

// Settings
const browserlistJson = require('./modules/writing/_browserslist.json')
const browserSyncJson = require('./modules/writing/_browserSync.json')
const criticalCSSJson = require('./modules/writing/_criticalCSS.json')
const cssJson = require('./modules/writing/_css.json')
const dependenciesJson = require('./modules/writing/_dependencies.json')
const devDependenciesJson = require('./modules/writing/_devDependencies.json')
const faviconsJson = require('./modules/writing/_favicons.json')
const filesJson = require('./modules/writing/_files.json')
const inlineJSJson = require('./modules/writing/_inlineJS.json')
const jqueryJson = require('./modules/writing/_jquery.json')
const minifyJson = require('./modules/writing/_minify.json')
const modernizrJson = require('./modules/writing/_modernizr.json')
const scriptsJson = require('./modules/writing/_scripts.json')
const vueJSJson = require('./modules/writing/_vueJS.json')

// Generator
module.exports = class extends Generator {
    constructor(args, opts) {
        super(args, opts)

        // Default
        this.promptsFunction = promptsFunction.bind(this)
        this.branding = branding.bind(this)
        this.basePackageJson = basePackageJson.bind(this)

        // Src Paths
        this.srcPathsJson = srcPathsJson.bind(this)

        // Dist Paths
        this.distPathsCraftCMSJson = distPathsCraftCMSJson.bind(this)
        this.distPathsCraftCMSBetaJson = distPathsCraftCMSBetaJson.bind(this)
        this.distPathsPrototypingJson = distPathsPrototypingJson.bind(this)
        this.distPathsWordpressJson = distPathsWordpressJson.bind(this)

        // Settings
        this.browserlistJson = browserlistJson.bind(this)
        this.browserSyncJson = browserSyncJson.bind(this)
        this.criticalCSSJson = criticalCSSJson.bind(this)
        this.cssJson = cssJson.bind(this)
        this.dependenciesJson = dependenciesJson.bind(this)
        this.devDependenciesJson = devDependenciesJson.bind(this)
        this.faviconsJson = faviconsJson.bind(this)
        this.filesJson = filesJson.bind(this)
        this.inlineJSJson = inlineJSJson.bind(this)
        this.jqueryJson = jqueryJson.bind(this)
        this.minifyJson = minifyJson.bind(this)
        this.modernizrJson = modernizrJson.bind(this)
        this.scriptsJson = scriptsJson.bind(this)
        this.vueJSJson = vueJSJson.bind(this)

        // Package Json
        this.pkg = require('../../package.json')
    }

    prompting() {
        // Have Yeoman greet the user.
        this.log(yosay(
            `Welcome to the impressive ${chalk.magenta('dhBoilerplate')} generator!`
        ))

        // Branding
        clear()
        console.log(this.branding(this.pkg.version, this.pkg.author.name, this.pkg.author.email, this.pkg.repository.url))

        this.log(`\n\n${chalk.magenta.bold(`  Prompting`)}\n  ${chalk.magenta.bold(`-----------------------------------------------------------------------------------------------`)}\n`)

        // Execute function so we get its returned array;
        const prompts = this.promptsFunction()
        return this.prompt(prompts).then(props => {
            // To access props later use this.props.someAnswer;
            this.props = props
        })
    }

    writing() {
        this.log(`\n\n${chalk.magenta.bold(`  Writing`)}\n  ${chalk.magenta.bold(`-----------------------------------------------------------------------------------------------`)}\n`)

        // Getting the template files
        const pkg = this.fs.readJSON(this.templatePath('_package.json'), {})

        // Write Settings into packackge.json
        this.basePackageJson({pkg})
        this.browserlistJson({pkg})
        this.browserSyncJson({pkg})
        this.criticalCSSJson({pkg})
        this.cssJson({pkg})
        this.dependenciesJson({pkg})
        this.devDependenciesJson({pkg})
        this.faviconsJson({pkg})
        this.filesJson({pkg})
        this.inlineJSJson({pkg})
        this.minifyJson({pkg})
        this.modernizrJson({pkg})
        this.scriptsJson({pkg})
        this.srcPathsJson({pkg})

        // If jQuery True
        if (this.props.projectJquery === true) {
            this.jqueryJson({pkg})
        }

        // If VueJS True
        if (this.props.projectVue === true) {
            this.vueJSJson({pkg})
        }

        // Write Dist Paths
        if (this.props.projectType === 'craftCMS') {
            this.distPathsCraftCMSJson({pkg})
        } else if (this.props.projectType === 'craftCMSBeta') {
            this.distPathsCraftCMSBetaJson({pkg})
        } else if (this.props.projectType === 'prototyping') {
            this.distPathsPrototypingJson({pkg})
        } else if (this.props.projectType === 'wordpress') {
            this.distPathsWordpressJson({pkg})
        }

        this.fs.writeJSON(this.destinationPath('package.json'), pkg)
    }

    install() {
        this.log(`\n\n${chalk.magenta.bold(`  Install`)}\n  ${chalk.magenta.bold(`-----------------------------------------------------------------------------------------------`)}\n`)
    }
}
