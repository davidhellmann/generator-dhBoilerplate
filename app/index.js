'use strict'
const util = require('util')
const path = require('path')
const Generator = require('yeoman-generator')
const yosay = require('yosay')
const chalk = require('chalk')
const mkdirp = require('mkdirp')
const commandExists = require('command-exists')
const clear = require('clear-terminal')
const extend = require('extend')

module.exports = class extends Generator {
    init() {
        this.pkg = require('../package.json')
        const done = this.async()

        this.welcome()
        this.checkStuff()
    }

    checkStuff() {
        let wp_cli = false
        let wget = false
        let gitInfo = false
        let composer = false

        // check if cli tools exist
        commandExists('wp')
            .then(function(command) {
                wp_cli = true
            }).catch(function() {
            this.wp_cli = false
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
    }

    welcome() {
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
    }

    prompting() {
        return this.prompt([
            {
                type: 'input',
                name: 'projectName',
                message: chalk.magenta.underline.bold('Project Name') + '\n\xb7 Please give the project a name (without Spaces): ',
                // default: 'dhBoilerplate',
                default: process.cwd().split('/').pop(-1).toLowerCase().replace(/[^a-zA-Z0-9]/g, ''),
                validate: function(input) {
                    // Do async stuff
                    if (input.indexOf(' ') >= 0 || /[~`!#$%\^&*+=\[\]\\';,/{}|\\":<>\?]/g.test(input)) {
                        // Pass the return value in the done callback
                        console.log(chalk.styles.magenta.open + '\n No whitespaces or special-chars allowed!' + chalk.styles.magenta.close);
                        return false;
                    }
                    return true;
                }
            }, {
                type: 'input',
                name: 'projectDescription',
                message: chalk.magenta.underline.bold('Project Description') + '\n\xb7 Short description of the Project: ',
                default: 'This is my super awesome project build with dh-Boilerplate.'
            }, {
                type: 'input',
                name: 'proxyUrl',
                message: 'Proxy URL',
                message: chalk.magenta.underline.bold('Proxy URL') + '\n\xb7 The URL for local decelopment. Leave blank if you prefer localhost or something else.',
                default: false
            }, {
                type: 'list',
                name: 'projectUsage',
                message: chalk.magenta.underline.bold('Project Usage') + '\n\xb7 Which purpose does this Project have? Choose the appropriate option: ',
                choices: [
                    'Craft CMS',
                    'Craft CMS Beta',
                    'WordPress',
                    'Prototyping'
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
            this.projectVersion = answers.projectVersion
            this.projectAuthor = answers.projectAuthor
            this.projectMail = answers.projectMail
            this.projectUrl = answers.projectUrl
            this.projectYarn = answers.projectYarn
            done()
        }.bind(this))
    }

    writing() {

    }
}
