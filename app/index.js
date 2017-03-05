'use strict'
const util = require('util')
const path = require('path')
const yeoman = require('yeoman-generator')
const yosay = require('yosay')
const chalk = require('chalk')
const mkdirp = require('mkdirp')
const commandExists = require('command-exists')
const clear = require('clear-terminal')

const dhBoilerplateGenerator = yeoman.generators.Base.extend({

    init() {
        this.pkg = require('../package.json')
    },

    askFor() {
        const done = this.async()
        let wp_cli = false
        let wget = false
        let gitInfo = false
        let composer = false

        // Have Yeoman greet the user.
        this.log(yosay(
            `Welcome to the impressive ${chalk.magenta('dhBoilerplate')} generator!`
        ))

        const welcome =
            chalk.styles.magenta.open +
            '\n                                                                                             ' +
            '\n                                                                                             ' +
            '\n                                                                                             ' +
            '\n                                                                                             ' +
            '\n                                                                                             ' +
            '\n                                        dddddddd                                             ' +
            '\n                                        d::::::dhhhhhhh                                      ' +
            '\n                                        d::::::dh:::::h                                      ' +
            '\n                                        d::::::dh:::::h                                      ' +
            '\n                                        d:::::d h:::::h                                      ' +
            '\n                                ddddddddd:::::d  h::::h hhhhh                                ' +
            '\n                              dd::::::::::::::d  h::::hh:::::hhh                             ' +
            '\n                             d::::::::::::::::d  h::::::::::::::hh                           ' +
            '\n                            d:::::::ddddd:::::d  h:::::::hhh::::::h                          ' +
            '\n                            d::::::d    d:::::d  h::::::h   h::::::h                         ' +
            '\n                            d:::::d     d:::::d  h:::::h     h:::::h                         ' +
            '\n                            d:::::d     d:::::d  h:::::h     h:::::h                         ' +
            '\n                            d:::::d     d:::::d  h:::::h     h:::::h                         ' +
            '\n                            d::::::ddddd::::::dd h:::::h     h:::::h                         ' +
            '\n                             d:::::::::::::::::d h:::::h     h:::::h                         ' +
            '\n                              d:::::::::ddd::::d h:::::h     h:::::h                         ' +
            '\n                               ddddddddd   ddddd hhhhhhh     hhhhhhh                         ' +
            '\n                                                                                             ' +
            '\n                                                                                             ' +
            chalk.styles.magenta.close +
            chalk.styles.yellow.open +
            '\n                                                                                             ' +
            '\n                          • • • dhBoilerplate made with love & help • • •                    ' +
            '\n                                                                                             ' +
            '\n                                                                                             ' +
            '\n                                                                                             ' +
            chalk.styles.yellow.close +
            chalk.styles.cyan.open +
            '\n              ---------------------------------------------------------------------          ' +
            '\n                                                                                             ' +
            '\n              Version  :   ' + (this.pkg.version) +
            '\n              Author   :   David Hellmann                                                    ' +
            '\n              Website  :   http://davidhellmann.com                                          ' +
            '\n              Github   :   https://github.com/davidhellmann/generator-dhBoilerplate          ' +
            '\n                                                                                             ' +
            '\n              ---------------------------------------------------------------------          ' +
            '\n                                                                                             ' +
            '\n                                                                                             ' +
            '\n                                                                                             ' +
            '\n                                                                                             ' +
            '\n                                                                                             ' +
            chalk.styles.cyan.close

        clear()
        console.log(welcome)

        // check if cli tools exist
        commandExists('wp')
            .then(function(command) {
                wp_cli = true
            }).catch(function() {
            wp_cli = false
        })

        commandExists('wget --help')
            .then(function(command) {
                wget = true
            }).catch(function() {
            wget = false
        })

        commandExists('composer')
            .then(function(command) {
                composer = true
            }).catch(function() {
            composer = false
        })

        // check git info
        commandExists('git')
            .then(function(command) {
                 gitInfo = {
                    name: exec('git config user.name', {silent: true}).replace(/\n/g, ''),
                    email: exec('git config user.email', {silent: true}).replace(/\n/g, ''),
                    github: exec('git config github.user', {silent: true}).replace(/\n/g, '')
                }
            }).catch(function() {
             gitInfo = {
                name: 'Author or Company Name',
                email: 'Author or Company Mail',
                github: ''
            }
        })

        return this.prompt([
            {
                type: 'input',
                name: 'projectName',
                message: chalk.magenta.underline.bold('Project Name') + '\n\xb7 Please give the project a name (without Spaces): ',
                // default: 'dhBoilerplate',
                default: process.cwd().split('/').pop(-1).toLowerCase().replace(/[^a-zA-Z0-9]/g, ''),
                validate: function(input) {
                    // Do async stuff
                    if (input.indexOf(' ') >= 0 || /[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/g.test(input)) {
                        // Pass the return value in the done callback
                        console.log('' + chalk.styles.red.open + 'No whitespaces or special-chars allowed!' + chalk.styles.red.close);
                        return false;
                    }
                    return true;
                }
            }, {
                type: 'input',
                name: 'projectDescription',
                message: chalk.magenta.underline.bold('Project Description') + '\n\xb7 Short description of the Project: ',
                default: 'undefined'
            }, {
                type: 'input',
                name: 'proxyUrl',
                message: 'Proxy URL',
                message: chalk.magenta.underline.bold('Proxy URL') + '\n\xb7 The URL for local decelopment. Inlcude http:// or https://',
                default: false
            }, {
                type: 'list',
                name: 'projectUsage',
                message: chalk.magenta.underline.bold('Project Usage') + '\n\xb7 Which purpose does this Project have? Choose the appropriate option: ',
                choices: [
                    'Prototyping',
                    'WordPress',
                    'Craft CMS',
                    'Craft CMS Beta'
                ]
            }, {
                when(answers) {
                    return answers.projectUsage === 'WordPress' && wp_cli
                },
                type: 'confirm',
                name: 'wordpressInstall',
                message: chalk.magenta.underline.bold('WordPress Install') + '\n\xb7 Do you want to download the latest WordPress Version via WP-CLI?',
                default: true
            }, {
                when(answers) {
                    return answers.projectUsage === 'Craft CMS' && wget
                },
                type: 'confirm',
                name: 'craftInstall',
                message: chalk.magenta.underline.bold('Craft CMS Install') + '\n\xb7 Do you want to download the newest Craft Version via WGET?',
                default: true
            }, {
                when(answers) {
                    return answers.projectUsage === 'Craft CMS Beta' && composer
                },
                type: 'confirm',
                name: 'craftBetaInstall',
                message: chalk.magenta.underline.bold('Craft CMS Install') + '\n\xb7 Do you want to install the Craft 3 Beta version via Composer?',
                default: true
            }, {
                when(answers) {
                    return answers.projectUsage === 'Craft CMS'
                },
                type: 'confirm',
                name: 'craftHearty',
                message: chalk.magenta.underline.bold('Craft CMS Hearty Config') + '\n\xb7 Do you want to use Hearty Config?',
                default: true
            }, {
                when(answers) {
                    return answers.projectUsage === 'Craft CMS' || 'Craft CMS Beta'
                },
                type: 'confirm',
                name: 'craftImager',
                message: chalk.magenta.underline.bold('Craft CMS Imager Config') + '\n\xb7 Do you want to use Imager?',
                default: true
            }, {
                when(answers) {
                    return answers.projectUsage === 'Craft CMS'
                },
                type: 'confirm',
                name: 'craftMultilang',
                message: chalk.magenta.underline.bold('Craft CMS Multilang Config') + '\n\xb7 Do you want to use Multilang Config?',
                default: false
            }, {
                type: 'confirm',
                name: 'projectjQuery',
                message: chalk.magenta.underline.bold('jQuery') + '\n\xb7 Do you want to use jQuery (newest Version)?',
                default: false
            }, {
                type: 'confirm',
                name: 'projectVue',
                message: chalk.magenta.underline.bold('Vue.js') + '\n\xb7 Do you want to use Vue.js?',
                default: false
            }, {
                type: 'input',
                name: 'projectVersion',
                message: chalk.magenta.underline.bold('Project Version') + '\n\xb7 The Version Number: ',
                default: '0.0.1'
            }, {
                type: 'input',
                name: 'projectAuthor',
                message: chalk.magenta.underline.bold('Project Author') + '\n\xb7 Project Author or company: ',
                default: gitInfo.name
            }, {
                type: 'input',
                name: 'projectMail',
                message: chalk.magenta.underline.bold('Project Mail') + '\n\xb7 Mailadress of the author: ',
                default: gitInfo.email
            }, {
                type: 'input',
                name: 'projectUrl',
                message: chalk.magenta.underline.bold('Author URL') + '\n\xb7 URL of the author: ',
                default: 'http://...'
            }
        ]).then(function(answers) {
            const checkAnswer = (answer) => {
                if (answer) {
                    return answer
                }
                return false
            }
            this.projectName = answers.projectName
            this.projectDescription = answers.projectDescription
            this.proxyUrl = answers.proxyUrl
            this.projectjQuery = answers.projectjQuery
            this.projectVue = answers.projectVue
            this.projectUsage = answers.projectUsage
            this.wordpressInstall = checkAnswer(answers.wordpressInstall)
            this.craftInstall = checkAnswer(answers.craftInstall)
            this.craftBetaInstall = checkAnswer(answers.craftBetaInstall)
            this.craftHearty = checkAnswer(answers.craftHearty)
            this.craftImager = checkAnswer(answers.craftImager)
            this.craftMultilang = checkAnswer(answers.craftMultilang)
            this.projectVersion = answers.projectVersion
            this.projectAuthor = answers.projectAuthor
            this.projectMail = answers.projectMail
            this.projectUrl = answers.projectUrl
            this.projectYarn = answers.projectYarn
            done()
        }.bind(this))
    },

    app() {
        // move src folder
        this.directory('___src/_system/', '___src/_system/')
        this.directory('___src/_data/', '___src/_data/')
        this.directory('___src/_imports/', '___src/_imports/')
        this.directory('___src/assets/', '___src/assets/')
        this.directory('___src/gulp/', './gulp/')

        if (this.projectUsage === `Prototyping`) {
            this.directory('___src/templates/prototyping/', '___src/templates/')
        }

        if (this.projectUsage === `WordPress`) {
            this.directory('___src/templates/wordpress/', '___src/templates/')
        }

        if (this.projectUsage === `Craft CMS Beta`) {

            // Copy Templates
            this.directory('___src/templates/craftcms/', '___src/templates/');

            // Copy Imager Config
            this.fs.copyTpl(
                this.templatePath('___src/_craft3/imager/imager.php'),
                this.destinationPath('___dist/config/imager.php')
            );

            // Copy Volumes Config
            this.fs.copyTpl(
                this.templatePath('___src/_craft3/volumes.php'),
                this.destinationPath('___dist/config/volumes.php')
            );

            // Copy General Config
            this.fs.copyTpl(
                this.templatePath('___src/_craft3/general.php'),
                this.destinationPath('___dist/config/general.php')
            );

            // Copy .env Config
            this.fs.copyTpl(
                this.templatePath('___src/_craft3/.env'),
                this.destinationPath('___dist/config/.env')
            );

            // Copy Pluginlist
            this.fs.copyTpl(
                this.templatePath('___src/_craft3/plugins/craft3-plugins.sh'),
                this.templatePath('___src/craft3-plugins.sh')
            );

            // Copy Redactor
            this.fs.copyTpl(
                this.templatePath('___src/_craft3/redactor/Standard.json'),
                this.destinationPath('___dist/config/redactor/' + this.projectName + '.json')
            );
        }

        if (this.projectUsage === `Craft CMS`) {
            if (this.craftHearty) {
                var craftPath = ''
                var craftIndex = 'index.hearty.php'
            } else {
                var craftPath = 'craft/'
                var craftIndex = 'index.php'
            }

            // Copy Templates
            this.directory('___src/templates/craftcms/', '___src/templates/');


            // Copy Imager Config
            this.fs.copyTpl(
                this.templatePath('___src/_craft/imager/imager.php'),
                this.destinationPath('___dist/' + craftPath + '/config/imager.php')
            );

            // Copy Index File for Craft
            this.fs.copyTpl(
                this.templatePath('___src/_craft/public/' + craftIndex),
                this.destinationPath('___dist/public/index.php')
            );


            // Copy Craft CLI
            this.fs.copyTpl(
                this.templatePath('___src/_craft/.craft-cli.php'),
                this.destinationPath('.craft-cli.php')
            );


            // Copy Plugins
            this.directory('___src/_craft/plugins/', '___dist/' + craftPath + '/plugins');


            // Copy Translations
            if (this.craftMultilang) {
                this.directory('___src/_craft/translations/', '___dist/' + craftPath + '/translations');
            }


            // Copy Hearty Config
            if (this.craftHearty) {
                this.directory('___src/_craft/hearty/config/', '___dist/config');
            }
        }
    },

    projectfiles() {
        const params = {
            projectName: this.projectName,
            projectDescription: this.projectDescription,
            proxyUrl: this.proxyUrl,
            projectjQuery: this.projectjQuery,
            projectVue: this.projectVue,
            projectUsage: this.projectUsage,
            wordpressInstall: this.wordpressInstall,
            craftInstall: this.craftInstall,
            craftBetaInstall: this.craftBetaInstall,
            craftHearty: this.craftHearty,
            craftImager: this.craftImager,
            craftMultilang: this.craftMultilang,
            projectVersion: this.projectVersion,
            projectAuthor: this.projectAuthor,
            projectMail: this.projectMail,
            projectUrl: this.projectUrl,
            projectYarn: this.projectYarn
        }


        this.fs.copyTpl(
            this.templatePath('_package.json'),
            this.destinationPath('package.json'),
            params
        )

        this.fs.copyTpl(
            this.templatePath('_config.json'),
            this.destinationPath('config.json'),
            params
        )

        this.fs.copyTpl(
            this.templatePath('_gulpfile.babel.js'),
            this.destinationPath('gulpfile.babel.js'),
            params
        )

        this.fs.copyTpl(
            this.templatePath('_readme.md'),
            this.destinationPath('readme.md'),
            params
        )

        this.fs.copyTpl(
            this.templatePath('_gitignore'),
            this.destinationPath('.gitignore'),
            params
        )

        this.fs.copyTpl(
            this.templatePath('_labels.json'),
            this.destinationPath('labels.json'),
            params
        )

        this.fs.copyTpl(
            this.templatePath('editorconfig'),
            this.destinationPath('.editorconfig'),
            params
        )

        this.fs.copyTpl(
            this.templatePath('jshintrc'),
            this.destinationPath('.jshintrc'),
            params
        )

        this.fs.copyTpl(
            this.templatePath('eslintrc'),
            this.destinationPath('.eslintrc'),
            params
        )

        this.fs.copyTpl(
            this.templatePath('eslintignore'),
            this.destinationPath('.eslintignore'),
            params
        )

        this.fs.copyTpl(
            this.templatePath('stylelintrc'),
            this.destinationPath('.stylelintrc'),
            params
        )

        this.fs.copyTpl(
            this.templatePath('stylelintignore'),
            this.destinationPath('.stylelintignore'),
            params
        )

        this.fs.copyTpl(
            this.templatePath('babelrc'),
            this.destinationPath('.babelrc'),
            params
        )
    },


    //  --------------------------------------------------------
    //  installing craft
    //  --------------------------------------------------------

    installCraft() {
        if (this.craftInstall) {
            const done = this.async()
            const self = this

            this.spawnCommand(`wget`, [`http://buildwithcraft.com/latest.tar.gz\?accept_license\=yes`]).on('close', () => {
                self.spawnCommand(`mkdir`, [`___dist`]).on('close', () => {
                    self.spawnCommand(`tar`, [`-zxvf`, `latest.tar.gz\?accept_license=yes`, `craft/`]).on('close', () => {
                        self.spawnCommand(`mv`, [`craft`, `___dist/`]).on('close', () => {
                            self.spawnCommand(`rm`, [`-rf`, `latest.tar.gz\?accept_license=yes`]).on('close', done)
                        })
                    })
                })
            })
        }
    },


    //  --------------------------------------------------------
    //  installing craft Beta
    //  --------------------------------------------------------

    installCraftBeta() {
        if (this.craftBetaInstall) {
            const done = this.async()
            this.spawnCommand(`composer`, [`create-project`, `craftcms/craft`, `___dist`, `-s`, `beta`]).on('close', done)
        }
    },


    //  --------------------------------------------------------
    //  installing WordPress
    //  --------------------------------------------------------

    installWordPress() {
        if (this.wordpressInstall) {
            const done = this.async()
            this.spawnCommand(`wp`, [`core`, `download`, `--path=___dist`]).on('close', done)
        }
    },


    //  --------------------------------------------------------
    //  Install Packages
    //  --------------------------------------------------------

    install() {
        const _self = this;

        // check if yarn is available and use it instead of npm
        commandExists('yarn', function(err, commandExists) {
            if (commandExists) {
                var done = _self.async()
                _self.spawnCommand('yarn').on('close', done)
            } else {
                _self.installDependencies({
                    bower: false,
                    npm: true
                })
            }
        })

        this.log('Install NPM Modules.')
        this.log('Give me a moment to do that…')
    }

})

module.exports = dhBoilerplateGenerator
