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
const promptsFunction = require('./modules/_prompts')
const branding = require('./helpers/prompts/_branding')
const basePackageJson = require('./modules/writing/_package.json')
const baseConfigJson = require('./modules/writing/_config.json')
const srcPathsJson = require('./modules/writing/_srcPaths.json')
const craftCMSDistPathsJson = require('./modules/writing/_craftCMSDistPaths.json')
const craftCMSBetaDistPathsJson = require('./modules/writing/_craftCMSBetaDistPaths.json')
const prototypingDistPathsJson = require('./modules/writing/_prototypingDistPaths.json')
const wordpressDistPathsJson = require('./modules/writing/_wordpressDistPaths.json')

// Generator
module.exports = class extends Generator {
    constructor(args, opts) {
        super(args, opts);
        this.promptsFunction = promptsFunction.bind(this)
        this.basePackageJson = basePackageJson.bind(this)
        this.baseConfigJson = baseConfigJson.bind(this)
        this.srcPathsJson = srcPathsJson.bind(this)
        this.craftCMSDistPathsJson = craftCMSDistPathsJson.bind(this)
        this.craftCMSBetaDistPathsJson = craftCMSBetaDistPathsJson.bind(this)
        this.prototypingDistPathsJson = prototypingDistPathsJson.bind(this)
        this.wordpressDistPathsJson = wordpressDistPathsJson.bind(this)

        this.pkg = require('../../package.json')
    }

    prompting() {
        // Have Yeoman greet the user.
        this.log(yosay(
            `Welcome to the impressive ${chalk.magenta('dhBoilerplate')} generator!`
        ))

        // Branding
        clear()
        console.log(branding(this.pkg.version, this.pkg.author.name, this.pkg.author.email, this.pkg.repository.url))

        this.log(`\n\n${chalk.magenta.bold(`  Prompting`)}\n  ${chalk.magenta.bold(`-----------------------------------------------------------------------------------------------`)}\n`)

        // Execute function so we get its returned array;
        const prompts = promptsFunction()
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
        this.basePackageJson({ pkg })
        this.srcPathsJson({ pkg })

        // Write Dist Paths
        if (this.props.projectUsage === 'craftCMS') {
            this.craftCMSDistPathsJson({ pkg })
        } else if (this.props.projectUsage === 'craftCMSBeta') {
            this.craftCMSBetaDistPathsJson({ pkg })
        } else if (this.props.projectUsage === 'prototyping') {
            this.prototypingDistPathsJson({ pkg })
        } else if (this.props.projectUsage === 'wordpress') {
            this.wordpressDistPathsJson({pkg})
        }

        // Write Stuff into config json
        this.baseConfigJson({ config })

        this.fs.writeJSON(this.destinationPath('package.json'), pkg)
        this.fs.writeJSON(this.destinationPath('config.json'), config)
    }

    install() {
        this.log(`\n\n${chalk.magenta.bold(`  Install`)}\n  ${chalk.magenta.bold(`-----------------------------------------------------------------------------------------------`)}\n`)
    }
}
