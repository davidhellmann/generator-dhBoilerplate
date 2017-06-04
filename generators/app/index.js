// Dependencies
const Generator = require('yeoman-generator')
const commandExists = require('command-exists').sync
const chalk = require('chalk')
const yosay = require('yosay')
const clear = require('clear-terminal')
const Pleasent = require('pleasant-progress')

// Installs
const intallCraftCMS = require('./modules/installs/_instsallCraftCMS')
const intallCraftCMS3 = require('./modules/installs/_instsallCraftCMS3')
const installWordpress = require('./modules/installs/_instsallWordpress')

// Package
const _pkg = require('../../package.json')

// Files
const filesEnviroment = require('./config/_files-enviroment.json')
const filesProject = require('./config/_files-project.json')
const foldersProject = require('./config/_folders-project.json')
const foldersProjectTpl = require('./config/_folders-project-tpl.json')

const progress = new Pleasent()

// Importing Modules
// Default
const promptsFunction = require('./modules/_prompts')
const basePackageJson = require('./modules/writings/_package.json')

// Messages
const branding = require('./helpers/messages/_branding')
const line = require('./helpers/messages/_line')

// Src Paths
const srcPathsJson = require('./modules/writings/_srcPaths.json')

// Dist Paths
const distPathsCraftCMSJson = require('./modules/writings/_distPathsCraftCMS.json')
const distPathsCraftCMS3Json = require('./modules/writings/_distPathsCraftCMS3.json')
const distPathsPrototypingJson = require('./modules/writings/_distPathsPrototyping.json')
const distPathsWordpressJson = require('./modules/writings/_distPathsWordpress.json')

// Settings
const browserlistJson = require('./modules/writings/_browserslist.json')
const browserSyncJson = require('./modules/writings/_browserSync.json')
const criticalCSSJson = require('./modules/writings/_criticalCSS.json')
const cssJson = require('./modules/writings/_css.json')
const dependenciesJson = require('./modules/writings/_dependencies.json')
const devDependenciesJson = require('./modules/writings/_devDependencies.json')
const faviconsJson = require('./modules/writings/_favicons.json')
const filesJson = require('./modules/writings/_files.json')
const inlineJSJson = require('./modules/writings/_inlineJS.json')
const jqueryJson = require('./modules/writings/_jquery.json')
const minifyJson = require('./modules/writings/_minify.json')
const modernizrJson = require('./modules/writings/_modernizr.json')
const scriptsJson = require('./modules/writings/_scripts.json')
const vueJSJson = require('./modules/writings/_vueJS.json')

// Generator
module.exports = class extends Generator {
    constructor(args, opts) {
        super(args, opts)

        // Default
        this.promptsFunction = promptsFunction.bind(this)
        this.basePackageJson = basePackageJson.bind(this)

        // Messages
        this.branding = branding.bind(this)
        this.line = line.bind(this)

        // Src Paths
        this.srcPathsJson = srcPathsJson.bind(this)

        // Dist Paths
        this.distPathsCraftCMSJson = distPathsCraftCMSJson.bind(this)
        this.distPathsCraftCMS3Json = distPathsCraftCMS3Json.bind(this)
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
    }

    prompting() {
        // Have Yeoman greet the user.
        this.log(yosay(`Welcome to the impressive ${chalk.magenta('dhBoilerplate')} generator!`))

        // Branding
        clear()
        this.log(this.branding(_pkg.version, _pkg.author.name, _pkg.author.email, _pkg.repository.url))

        this.log(`${chalk.magenta('  Prompting')}`)
        this.log(this.line())


        // Execute function so we get its returned array;
        const prompts = this.promptsFunction()
        return this.prompt(prompts).then((props) => {
            // To access props later use this.props.someAnswer;
            this.props = props
        })
    }

    writePackageJson() {
        this.log(`\n\n${chalk.magenta('  Writing')}\n`)
        this.log(this.line())

        // Getting the template files
        const pkg = this.fs.readJSON(this.templatePath('_package.json'), {})

        // Write Settings into packackge.json
        this.basePackageJson({ pkg })
        this.browserlistJson({ pkg })
        this.browserSyncJson({ pkg })
        this.criticalCSSJson({ pkg })
        this.cssJson({ pkg })
        this.dependenciesJson({ pkg })
        this.devDependenciesJson({ pkg })
        this.faviconsJson({ pkg })
        this.filesJson({ pkg })
        this.inlineJSJson({ pkg })
        this.minifyJson({ pkg })
        this.modernizrJson({ pkg })
        this.scriptsJson({ pkg })
        this.srcPathsJson({ pkg })

        // If jQuery True
        if (this.props.projectJquery === true) {
            this.jqueryJson({ pkg })
        }

        // If VueJS True
        if (this.props.projectVue === true) {
            this.vueJSJson({ pkg })
        }

        // Write Dist Paths
        if (this.props.projectType === 'craftCMS') {
            this.distPathsCraftCMSJson({ pkg })
        } else if (this.props.projectType === 'craftCMS3') {
            this.distPathsCraftCMS3Json({ pkg })
        } else if (this.props.projectType === 'prototyping') {
            this.distPathsPrototypingJson({ pkg })
        } else if (this.props.projectType === 'wordpress') {
            this.distPathsWordpressJson({ pkg })
        }

        // Wirte package.json
        this.fs.writeJSON(this.destinationPath('package.json'), pkg)
    }

    movingProjectFolders() {
        /* -------------------------------------------------- */
        /*    Moving Project Folders
         /* -------------------------------------------------- */

        this.log(`${chalk.cyan('  Moving Project Folders')}`)
        progress.start('Moving Project Folders')

        // Folders with Yeoman Logic
        for (let i = 0; i < foldersProjectTpl.files.length; i += 1) {
            if (foldersProjectTpl.files[i].projectContext.includes(this.props.projectType)) {
                this.fs.copyTpl(
                    this.templatePath(foldersProjectTpl.files[i].src),
                    this.destinationPath(foldersProjectTpl.files[i].dest),
                    this.props
                )
            }
        }

        // Folders without Yeoman Logic
        for (let i = 0; i < foldersProject.files.length; i += 1) {
            if (foldersProject.files[i].projectContext.includes(this.props.projectType)) {
                this.fs.copy(
                    this.templatePath(foldersProject.files[i].src),
                    this.destinationPath(foldersProject.files[i].dest)
                )
            }
        }
        progress.stop()
    }

    movingProjectFiles() {
        /* -------------------------------------------------- */
        /*    Moving Project Files
         /* -------------------------------------------------- */

        this.log(`${chalk.cyan('  Moving Project Files')}`)
        progress.start('Moving Project Files')

        for (let i = 0; i < filesProject.files.length; i += 1) {
            if (filesProject.files[i].projectContext.includes(this.props.projectType)) {
                this.fs.copy(
                    this.templatePath(filesProject.files[i].src),
                    this.destinationPath(filesProject.files[i].dest)
                )
            }
        }

        progress.stop()
    }

    movingEnviromentFiles() {
        /* -------------------------------------------------- */
        /*    Moving Enviroment Files
         /* -------------------------------------------------- */

        this.log(`${chalk.cyan('  Moving Enviroment Files')}`)
        progress.start('Moving Enviroment Files')

        for (let i = 0; i < filesEnviroment.files.length; i += 1) {
            this.fs.copyTpl(
                this.templatePath(filesEnviroment.files[i].src),
                this.destinationPath(filesEnviroment.files[i].dest),
                this.props
            )
        }

        progress.stop()
    }

    writing() {
        // Write Package JSON
        this.writePackageJson()

        // Moving Project Folders
        this.movingProjectFolders()

        // Moving Project Files
        this.movingProjectFiles()

        // Moving Enviroment Fikes
        this.movingEnviromentFiles()
    }

    download() {
        // Install Craft CMS
        if (this.props.craftCMSInstall) {
            clear()
            intallCraftCMS(this)
        }

        // Install Craft CMS 3
        if (this.props.craftCMS3Install) {
            clear()
            intallCraftCMS3(this)
        }

        // Install WordPress
        if (this.props.wordpressInstall) {
            clear()
            installWordpress(this)
        }
    }

    install() {
        clear()
        this.log(`\n\n${chalk.magenta('  Install')}\n`)
        this.log(this.line())

        const isYarn = commandExists('yarn')
        this.log(`${chalk.magenta('  Download all the NPM Modules…')}`)
        this.log(`${chalk.yellow('  Give me a moment to do that……')}\n`)
        this.log(this.line())
        this.installDependencies({
            yarn: isYarn,
            npm: !isYarn,
            bower: false
            // SkipInstall: this.options['skip-install']
        })
    }
}
