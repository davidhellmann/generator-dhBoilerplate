// Dependencies
const chalk = require('chalk')
const clear = require('clear-terminal')
const commandExists = require('command-exists')
const fs = require('fs-extra')
const Generator = require('yeoman-generator')
const yosay = require('yosay')

// Import Helpers & Package File
const _pkg = require('../../package.json')
const branding = require('./helpers/messages/_branding')
const logMessage = require('./helpers/messages/_logMessage')

// Install CMS Stuff
// const installCraftCMS = require('./modules/installs/_instsallCraftCMS')
const installCraftCMS = require('./modules/writings/craftCMS')
const installCraftCMS3 = require('./modules/writings/craftCMS3')
const installWordpress = require('./modules/writings/wordpress')

// Package JSON
const writePackageJson = require('./modules/writings/packageJson')

// Config Files for moving Files & Folders
const filesEnvironment = require('./config/_filesEnvironment')
const filesProject = require('./config/_filesProject')
const foldersProject = require('./config/_foldersProject')
const foldersProjectTpl = require('./config/_foldersProjectTpl')

// Importing Modules
const promptsFunction = require('./modules/_prompts')
const basePackageJson = require('./modules/writings/_package.json')

// Src Paths
const srcPathsJson = require('./modules/writings/_srcPaths.json')

// Dist Paths
const distPathsCraftCMSJson = require('./modules/writings/_distPathsCraftCMS.json')
const distPathsCraftCMS3Json = require('./modules/writings/_distPathsCraftCMS3.json')
const distPathsPrototypingJson = require('./modules/writings/_distPathsPrototyping.json')
const distPathsWordpressJson = require('./modules/writings/_distPathsWordpress.json')

// Generator
module.exports = class extends Generator {

    // Constructor
    constructor(args, opts) {
        super(args, opts)

        // Default
        this.promptsFunction = promptsFunction.bind(this)
        this.basePackageJson = basePackageJson.bind(this)

        // Messages
        this.branding = branding.bind(this)
        this.logMessage = logMessage.bind(this)

        // Files & Folders
        this.filesEnvironment = filesEnvironment
        this.filesProject = filesProject
        this.foldersProject = foldersProject
        this.foldersProjectTpl = foldersProjectTpl

        // Src Paths
        this.srcPathsJson = srcPathsJson.bind(this)

        // Dist Paths
        this.distPathsCraftCMSJson = distPathsCraftCMSJson.bind(this)
        this.distPathsCraftCMS3Json = distPathsCraftCMS3Json.bind(this)
        this.distPathsPrototypingJson = distPathsPrototypingJson.bind(this)
        this.distPathsWordpressJson = distPathsWordpressJson.bind(this)

        // CMS Stuff
        this.installCraftCMS = installCraftCMS.bind(this)
        this.installCraftCMS3 = installCraftCMS3.bind(this)
        this.installWordpress = installWordpress.bind(this)

        // Package JSON
        this.writePackageJson = writePackageJson.bind(this)

        this.commands = {
            composer: false,
            yarn: false,
            git: false,
            wp: false
        }
    }

    // Initializing
    async initializing() {
        this.logMessage({message: 'Initializing the Generator', short: false})
        try {
            await commandExists('composer')
            this.commands.composer = true
            await commandExists('yarn')
            this.commands.yarn = true
            await commandExists('git')
            this.commands.git = true
            await commandExists('wp')
            this.commands.wp = true
        } catch(e) {
            if (e) console.error(e)
        }
    }

    // Prompting
    prompting() {
        // Have Yeoman greet the user.
        this.log(yosay(
            `Welcome to the impressive ${chalk.magenta('dhBoilerplate')} generator!`
        ))

        if (process.env.NODE_ENV !== 'test') {
            clear()
        }

        // Branding
        this.log(this.branding(_pkg.version, _pkg.author.name, _pkg.author.email, _pkg.repository.url))
        this.logMessage({message: 'Prompting', short: false})

        // Execute function so we get its returned array;
        const prompts = this.promptsFunction()
        return this.prompt(prompts).then((props) => {
            // To access props later use this.props.someAnswer;
            this.props = props
        })
    }

    // Configuration
    async configuration() {
        this.logMessage({message: 'Configure Project', short: false})

        // Install Craft CMS
        if (this.props.projectType === 'craftCMS' && this.props.craftCMSInstall) {
            try {
                await this.installCraftCMS().download(this)
            } catch (e) {
                console.error(e)
            }
        }

        // Install Craft CMS 3
        if (this.props.projectType === 'craftCMS3' && this.props.craftCMS3Install && this.commands.composer) {
            try {
                await this.installCraftCMS3().download(this)
            } catch (e) {
                console.error(e)
            }
        }

        // WordPress
        if (this.props.projectType === 'wordpress' && this.props.wordpressInstall && this.commands.wp) {
            try {
                await this.installWordpress().download(this)
            } catch (e) {
                console.error(e)
            }
        }
    }

    // Writing
    async writing() {
        this.logMessage({message: 'Writing files', short: false})

        // Package JSON
        this.writePackageJson().writing(this)

        // Craft CMS
        if (this.props.projectType === 'craftCMS') {
            this.logMessage({message: 'Moving Craft Folders'});
            try {
                await this.installCraftCMS().writing(this)
            } catch (e) {
                console.error(e)
            }
        }

        // Craft CMS 3
        if (this.props.projectType === 'craftCMS3') {
            this.logMessage({message: 'Moving Craft Folders'});
            try {
                await this.installCraftCMS3().writing(this)
            } catch (e) {
                console.error(e)
            }
        }

        // Environment Files
        this.logMessage({message: 'Moving Environment Files'})
        this.filesEnvironment.files.forEach(file => {
            this.fs.copyTpl(
                this.templatePath(file.src),
                this.destinationPath(file.dest),
                this.props
            )
        })

        // Project Folders
        this.logMessage({message: 'Moving Project Folders'})

        // With Yeoman Logic
        this.foldersProjectTpl.files.forEach(file => {
            if (file.projectContext.includes(this.props.projectType)) {
                this.fs.copyTpl(
                    this.templatePath(file.src),
                    this.destinationPath(file.dest),
                    this.props
                )
            }
        })

        // Without Yeoman Logic
        this.foldersProjectTpl.files.forEach(file => {
            if (file.projectContext.includes(this.props.projectType)) {
                this.fs.copy(
                    this.templatePath(file.src),
                    this.destinationPath(file.dest)
                )
            }
        })

        // Project Files
        this.logMessage({message: 'Moving Project Files'})
        this.filesProject.files.forEach(file => {
            if (file.projectContext.includes(this.props.projectType)) {
                this.fs.copy(
                    this.templatePath(file.src),
                    this.destinationPath(file.dest)
                )
            }
        })

        // Git
        this.logMessage({
            message: '> Initializing git and make first commit',
            short: true,
            color: 'green'
        })

        if (this.commands.git) {
            try {
                await this.spawnCommandSync('git', ['init'])
                if (process.env.NODE_ENV === 'test') {
                    return
                }
                await this.spawnCommandSync('git', ['add', '-A'])
                await this.spawnCommandSync('git', ['commit', '-m "initial commit"'])

            } catch (e) {
                console.error(e)
            }
        }
    }

    // Install
    install() {
        this.logMessage({message: 'Install', short: false})
        this.logMessage({message: 'Download all the NPM Modules…'})
        this.logMessage({message: 'Give me a moment to do that…'})

        if (this.commands.yarn) {
            this.yarnInstall()
        } else {
            this.npmInstall()
        }
    }
}
