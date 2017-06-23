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
let destPath = './'

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

    async configuration() {
        this.logMessage({message: 'Check if package.json file exists…'})
        const _package = './package.json'
        if (filesystem.existsSync(_package)) {
            const json = JSON.parse(filesystem.readFileSync(_package, 'utf8'))
            this.log(`  package.json exists…`)
            if (json.src.modules.base !== undefined) {
                destPath = json.src.modules.base
                this.log(`  Modules Folder: ${destPath}`)
            } else {
                destPath = './'
                this.log(`  Modules Folder: ${destPath}`)
            }
        } /*else {
            const content = JSON.stringify({ src: { templates: '___src/templates/_modules/' } }, null, 4)
            this.log(`  There is no package.json… We create one!`)
            this.log(`  package.json created!`)
            this.log(`  Modules Folder: ${destPath}`)
            filesystem.writeFile('package.json', content, (err) => {
                if (err) return console.log(err)
            })
        }*/
    }

    // Writing
    async writing() {
        this.logMessage({message: 'Creating Module…'})
        this.filesModuleTpl(this, destPath).files.forEach(file => {
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
