const Generator = require('yeoman-generator')
const commandExists = require('command-exists').sync
const chalk = require('chalk')
const yosay = require('yosay')
const clear = require('clear-terminal')
const Pleasent = require('pleasant-progress')
const intallCraftCMS = require('./modules/install/_instsallCraftCMS')
const intallCraftCMS3 = require('./modules/install/_instsallCraftCMS3')
const installWordpress = require('./modules/install/_instsallWordpress')
const _pkg = require('../../package.json')

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
const distPathsCraftCMS3Json = require('./modules/writing/_distPathsCraftCMS3.json')
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
        this.log(this.branding(_pkg.version, _pkg.author.name, _pkg.author.email, _pkg.repository.url))

        this.log(`\n\n${chalk.magenta.bold('  Prompting')}\n`)
        this.log(`${chalk.magenta.bold('  -----------------------------------------------------------------------------------------------')}\n`)

        // Execute function so we get its returned array;
        const prompts = this.promptsFunction()
        return this.prompt(prompts).then((props) => {
            // To access props later use this.props.someAnswer;
            this.props = props
        })
    }

    writing() {
        this.log(`\n\n${chalk.magenta.bold('  Writing')}\n`)
        this.log(`${chalk.magenta.bold('  -----------------------------------------------------------------------------------------------')}\n`)

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
        } else if (this.props.projectType === 'craftCMS3') {
            this.distPathsCraftCMS3Json({pkg})
        } else if (this.props.projectType === 'prototyping') {
            this.distPathsPrototypingJson({pkg})
        } else if (this.props.projectType === 'wordpress') {
            this.distPathsWordpressJson({pkg})
        }

        // Wirte package.json
        this.fs.writeJSON(this.destinationPath('package.json'), pkg)

        /* -------------------------------------------------- */
        /*    Moving Project Folders
         /* -------------------------------------------------- */

        this.log(`${chalk.cyan.bold('  Moving Project Folders')}`)
        progress.start('Moving Project Folders')

        // Folders with Yeoman Logic
        const foldersTpl = [
            // All
            {
                projectContext: ['craftCMS', 'craftCMS3', 'prototyping', 'wordpress'],
                src: '___src/assets/css/',
                dest: '___src/assets/css/'
            },
            {
                projectContext: ['craftCMS', 'craftCMS3', 'prototyping', 'wordpress'],
                src: '___src/assets/js/',
                dest: '___src/assets/js/'
            },
            {
                projectContext: ['craftCMS', 'craftCMS3', 'prototyping', 'wordpress'],
                src: '___src/_system/',
                dest: '___src/_system/'
            },
            {
                projectContext: ['craftCMS', 'craftCMS3', 'prototyping', 'wordpress'],
                src: '___src/gulp/',
                dest: './gulp/'
            },

            // Craft CMS
            {
                projectContext: ['craftCMS', 'craftCMS3'],
                src: '___src/templates/craftcms/',
                dest: '___src/templates/'
            },

            // Prototyping
            {
                projectContext: ['prototyping'],
                src: '___src/templates/prototyping/',
                dest: '___src/templates/'
            },

            // WordPress
            {
                projectContext: ['wordpress'],
                src: '___src/templates/wordpress/',
                dest: '___src/templates/'
            }
        ]

        for (let i = 0; i < foldersTpl.length; i += 1) {
            if (foldersTpl[i].projectContext.includes(this.props.projectType)) {
                this.fs.copyTpl(
                    this.templatePath(foldersTpl[i].src),
                    this.destinationPath(foldersTpl[i].dest),
                    this.props
                )
            }
        }

        // Folders without Yeoman Logic
        const folders = [
            // All

            {
                projectContext: ['craftCMS', 'craftCMS3', 'prototyping', 'wordpress'],
                src: '___src/assets/fonts/',
                dest: '___src/assets/fonts/'
            },
            {
                projectContext: ['craftCMS', 'craftCMS3', 'prototyping', 'wordpress'],
                src: '___src/assets/images/',
                dest: '___src/assets/images/'
            },

            // Craft CMS
            {
                projectContext: ['craftCMS', 'craftCMS3'],
                src: '___src/_imports/',
                dest: '___src/_imports/'
            },

            {
                projectContext: ['craftCMS'],
                src: '___src/_craftCMS/public/uploads/',
                dest: '___dist/public/uploads'
            },
            {
                projectContext: ['craftCMS'],
                src: '___src/_craftCMS/plugins/',
                dest: '___dist/craft/plugins'
            },
            {
                projectContext: ['craftCMS'],
                src: '___src/_craftCMS/translations/',
                dest: '___dist/craft/translations'
            },

            {
                projectContext: ['craftCMS3'],
                src: '___src/_craftCMS3/web/uploads/',
                dest: '___dist/web/uploads'
            },

            // Prototyping
            {
                projectContext: ['prototyping'],
                src: '___src/_data/',
                dest: '___src/_data/'
            }
        ]

        for (let i = 0; i < folders.length; i += 1) {
            if (folders[i].projectContext.includes(this.props.projectType)) {
                this.fs.copy(
                    this.templatePath(folders[i].src),
                    this.destinationPath(folders[i].dest)
                )
            }
        }
        progress.stop()

        /* -------------------------------------------------- */
        /*    Moving Project Files
         /* -------------------------------------------------- */

        this.log(`${chalk.cyan.bold('  Moving Project Files')}`)
        progress.start('Moving Project Files')

        const filesProject = [

            // Craft CMS
            {
                projectContext: ['craftCMS'],
                src: '___src/_craftCMS/imager/imager.php',
                dest: '___dist/craft/config/imager.php'
            },
            {
                projectContext: ['craftCMS'],
                src: '___src/_craftCMS/db.php',
                dest: '___dist/craft/config/db.php'
            },
            {
                projectContext: ['craftCMS'],
                src: '___src/_craftCMS/general.php',
                dest: '___dist/craft/config/general.php'
            },
            {
                projectContext: ['craftCMS'],
                src: '___src/_craftCMS/public/index.php',
                dest: '___dist/public/index.php'
            },
            {
                projectContext: ['craftCMS'],
                src: '___src/_craftCMS/.env.php',
                dest: '___dist/.env.php'
            },
            {
                projectContext: ['craftCMS'],
                src: '___src/_craftCMS/example.env.php',
                dest: '___dist/example.env.php'
            },
            {
                projectContext: ['craftCMS'],
                src: '___src/_craftCMS/.craft-cli.php',
                dest: '.craft-cli.php'
            },
            {
                projectContext: ['craftCMS'],
                src: '___src/_craftCMS/redactor/custom.json',
                dest: '___dist/craft/config/redactor/custom.json'
            },

            {
                projectContext: ['craftCMS3'],
                src: '___src/_craftCMS3/imager/imager.php',
                dest: '___dist/config/imager.php'
            },
            {
                projectContext: ['craftCMS3'],
                src: '___src/_craftCMS3/db.php',
                dest: '___dist/config/db.php'
            },
            {
                projectContext: ['craftCMS3'],
                src: '___src/_craftCMS3/general.php',
                dest: '___dist/config/general.php'
            },
            {
                projectContext: ['craftCMS3'],
                src: '___src/_craftCMS3/web/index.php',
                dest: '___dist/web/index.php'
            },
            {
                projectContext: ['craftCMS3'],
                src: '___src/_craftCMS3/volumes.php',
                dest: '___dist/config/volumes.php'
            },
            {
                projectContext: ['craftCMS3'],
                src: '___src/_craftCMS3/craft',
                dest: '___dist/craft'
            },
            {
                projectContext: ['craftCMS3'],
                src: '___src/_craftCMS3/.env.php',
                dest: '___dist/.env.php'
            },
            {
                projectContext: ['craftCMS3'],
                src: '___src/_craftCMS3/example.env.php',
                dest: '___dist/example.env.php'
            },
            {
                projectContext: ['craftCMS3'],
                src: '___src/_craftCMS3/plugins/craft3-plugins.sh',
                dest: '___dist/craft3-plugins.sh'
            },
            {
                projectContext: ['craftCMS3'],
                src: '___src/_craftCMS3/redactor/custom.json',
                dest: '___dist/config/redactor/custom.json'
            }
        ]

        for (let i = 0; i < filesProject.length; i += 1) {
            if (filesProject[i].projectContext.includes(this.props.projectType)) {
                this.fs.copy(
                    this.templatePath(filesProject[i].src),
                    this.destinationPath(filesProject[i].dest)
                )
            }
        }

        progress.stop()

        /* -------------------------------------------------- */
        /*    Moving Enviroment Files
         /* -------------------------------------------------- */

        this.log(`${chalk.cyan.bold('  Moving Enviroment Files')}`)
        progress.start('Moving Enviroment Files')

        const filesEnviroment = [
            {
                src: '_gulpfile.babel.js',
                dest: 'gulpfile.babel.js'
            },
            {
                src: '_readme.md',
                dest: 'readme.md'
            },
            {
                src: '_gitignore',
                dest: '.gitignore'
            },
            {
                src: '_labels.json',
                dest: 'labels.json'
            },
            {
                src: 'editorconfig',
                dest: '.editorconfig'
            },
            {
                src: 'jshintrc',
                dest: '.jshintrc'
            },
            {
                src: 'eslintrc',
                dest: '.eslintrc'
            },
            {
                src: 'eslintignore',
                dest: '.eslintignore'
            },
            {
                src: 'stylelintrc',
                dest: '.stylelintrc'
            },
            {
                src: 'stylelintignore',
                dest: '.stylelintignore'
            },
            {
                src: 'babelrc',
                dest: '.babelrc'
            }
        ]

        for (let i = 0; i < filesEnviroment.length; i += 1) {
            this.fs.copyTpl(
                this.templatePath(filesEnviroment[i].src),
                this.destinationPath(filesEnviroment[i].dest),
                this.props
            )
        }

        progress.stop()
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
        this.log(`\n\n${chalk.magenta.bold('  Install')}\n`)
        this.log(`${chalk.magenta.bold('  -----------------------------------------------------------------------------------------------')}\n`)

        const isYarn = commandExists('yarn')
        this.log(`${chalk.magenta('  Download all the NPM Modules…')}`)
        this.log(`${chalk.yellow('  Give me a moment to do that……')}`)
        this.log(`${chalk.magenta('\n  -----------------------------------------------------------------------------------------------')}\n`)
        this.installDependencies({
            yarn: isYarn,
            npm: !isYarn,
            bower: false
            // SkipInstall: this.options['skip-install']
        })
    }
}
