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
const baseConfigJson = require('./modules/writing/_config.json')

// Src Paths
const srcPathsJson = require('./modules/writing/_srcPaths.json')

// Dist Paths
const distPathsCraftCMSJson = require('./modules/writing/_distPathsCraftCMS.json')
const distPathsCraftCMSBetaJson = require('./modules/writing/_distPathsCraftCMSBeta.json')
const distPathsPrototypingJson = require('./modules/writing/_distPathsPrototyping.json')
const distPathsWordpressJson = require('./modules/writing/_distPathsWordpress.json')

// Browserlist
const browserlistJson = require('./modules/writing/_browserslist.json')

// Scripts
const scriptsJson = require('./modules/writing/_scripts.json')

// Generator
module.exports = class extends Generator {
    constructor(args, opts) {
        super(args, opts)

        // Default
        this.promptsFunction = promptsFunction.bind(this)
        this.branding = branding.bind(this)
        this.basePackageJson = basePackageJson.bind(this)
        this.baseConfigJson = baseConfigJson.bind(this)

        // Src Paths
        this.srcPathsJson = srcPathsJson.bind(this)

        // Dist Paths
        this.distPathsCraftCMSJson = distPathsCraftCMSJson.bind(this)
        this.distPathsCraftCMSBetaJson = distPathsCraftCMSBetaJson.bind(this)
        this.distPathsPrototypingJson = distPathsPrototypingJson.bind(this)
        this.distPathsWordpressJson = distPathsWordpressJson.bind(this)

        // Browserlist
        this.browserlistJson = browserlistJson.bind(this)

        // SCripts
        this.scriptsJson = scriptsJson.bind(this)

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
        const config = this.fs.readJSON(this.templatePath('_config.json'), {})

        // Write Stuff into package.json
        this.basePackageJson({pkg})
        this.srcPathsJson({pkg})
        this.browserlistJson({pkg})
        this.scriptsJson({pkg})

        // Write Dist Paths
        if (this.props.projectUsage === 'craftCMS') {
            this.distPathsCraftCMSJson({pkg})
        } else if (this.props.projectUsage === 'craftCMSBeta') {
            this.distPathsCraftCMSBetaJson({pkg})
        } else if (this.props.projectUsage === 'prototyping') {
            this.distPathsPrototypingJson({pkg})
        } else if (this.props.projectUsage === 'wordpress') {
            this.distPathsWordpressJson({pkg})
        }

        // Write Stuff into config json
        this.baseConfigJson({config})

        this.fs.writeJSON(this.destinationPath('package.json'), pkg)
        this.fs.writeJSON(this.destinationPath('config.json'), config)
    }

    install() {
        this.log(`\n\n${chalk.magenta.bold(`  Install`)}\n  ${chalk.magenta.bold(`-----------------------------------------------------------------------------------------------`)}\n`)
    }
}
