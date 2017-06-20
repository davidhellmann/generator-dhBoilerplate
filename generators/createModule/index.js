// Dependencies
const chalk = require('chalk')
const clear = require('clear-terminal')
const commandExists = require('command-exists')
const filesystem = require('fs-extra')
const Generator = require('yeoman-generator')
const yosay = require('yosay')

// Import Helpers & Package File
const _pkg = require('../../package.json')
const branding = require('./helpers/messages/_branding')
const logMessage = require('./helpers/messages/_logMessage')

// Config Files for moving Files & Folders
const filesModuleTpl = require('./config/_filesModuleTpl')

// Importing Modules
const promptsFunction = require('./modules/_prompts')

// Generator
module.exports = class extends Generator {

    // Constructor
    constructor(args, opts) {
        super(args, opts)

        // Default
        this.promptsFunction = promptsFunction.bind(this)

        // Messages
        this.branding = branding.bind(this)
        this.logMessage = logMessage.bind(this)

        // Files
        this.filesModuleTpl = filesModuleTpl.bind(this)
    }

    // Prompting
    prompting() {
        // Branding
        this.log(this.branding())

        // Execute function so we get its returned array;
        const prompts = this.promptsFunction()
        return this.prompt(prompts).then((props) => {
            // To access props later use this.props.someAnswer;
            this.props = props
        })
    }

    // Writing
    async writing() {
        this.logMessage({message: 'Creating Module…'})
        this.filesModuleTpl(this).files.forEach(file => {
            if (this.props.moduleFiles.includes(file.type)) {
                this.fs.copyTpl(
                    this.templatePath(file.src),
                    this.destinationPath(file.dest),
                    this.props
                )
            }
        })
    }

    end() {
        this.logMessage({message: `Module ${this.props.moduleName} created!`})
    }
}
