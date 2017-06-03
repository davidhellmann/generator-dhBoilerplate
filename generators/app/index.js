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

// Generator
module.exports = class extends Generator {
    constructor(args, opts) {
        super(args, opts);
        this.promptsFunction = promptsFunction.bind(this)
        this.basePackageJson = basePackageJson.bind(this)
        this.baseConfigJson = baseConfigJson.bind(this)

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

        this.log(`\n\n\n${chalk.magenta.bold(`[ ---  Prompting  --------------------------------------------------------- ]`)}`)
    }

    writing() {
        this.log(`\n\n\n${chalk.magenta.bold(`[ ---  Writing  ----------------------------------------------------------- ]`)}`)
    }

    install() {
        this.log(`\n\n\n${chalk.magenta.bold(`[ ---  Installing  -------------------------------------------------------- ]`)}`)
    }
}
