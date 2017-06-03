'use strict'
const util = require('util')
const path = require('path')
const yeoman = require('yeoman-generator')
const yosay = require('yosay')
const chalk = require('chalk')
const mkdirp = require('mkdirp')
const commandExists = require('command-exists')
const clear = require('clear-terminal')
const extend = require('extend')

const dhBoilerplateGenerator = yeoman.Base.extend({

    //  --------------------------------------------------------
    //  installing craft
    //  --------------------------------------------------------

    installCraft() {
        if (this.craftInstall) {

            clear()
            this.log(`${chalk.magenta('---------------------------------------------------------------------')}`)
            this.log('')
            this.log(`${chalk.magenta('Download the latest Craft CMS Version…')}`)
            this.log(`${chalk.yellow('Give me a moment to do that……')}`)
            this.log('')
            this.log(`${chalk.magenta('---------------------------------------------------------------------')}`)
            const done = this.async()
            const self = this

            this.spawnCommand(`wget`, [`http://buildwithcraft.com/latest.tar.gz\?accept_license\=yes`]).on('close', () => {
                self.spawnCommand(`mkdir`, [`___dist`]).on('close', () => {
                    self.spawnCommand(`tar`, [`-zxvf`, `latest.tar.gz\?accept_license=yes`, `craft/`]).on('close', () => {
                        self.spawnCommand(`mv`, [`craft`, `___dist/`]).on('close', () => {
                            self.spawnCommand(`rm`, [`-rf`, `latest.tar.gz\?accept_license=yes`]).on('close', done),
                            self.spawnCommand(`rm`, [`-rf`, `___dist/craft/config/db.php`]).on('close', done),
                            self.spawnCommand(`rm`, [`-rf`, `___dist/craft/config/general.php`]).on('close', done)
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

            clear()
            this.log(`${chalk.magenta('---------------------------------------------------------------------')}`)
            this.log('')
            this.log(`${chalk.magenta('Download the latest Craft CMS Beta…')}`)
            this.log(`${chalk.yellow('Give me a moment to do that……')}`)
            this.log('')
            this.log(`${chalk.magenta('---------------------------------------------------------------------')}`)

            const done = this.async()
            this.spawnCommand(`composer`, [`create-project`, `craftcms/craft`, `___dist`, `-s`, `beta`]).on('close', done)
        }
    },


    //  --------------------------------------------------------
    //  installing WordPress
    //  --------------------------------------------------------

    installWordPress() {

        if (this.wordpressInstall) {

            clear()
            this.log(`${chalk.magenta('---------------------------------------------------------------------')}`)
            this.log('')
            this.log(`${chalk.magenta('Download the latest WordPress Version…')}`)
            this.log(`${chalk.yellow('Give me a moment to do that……')}`)
            this.log('')
            this.log(`${chalk.magenta('---------------------------------------------------------------------')}`)

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

        clear()
        this.log(`${chalk.magenta('---------------------------------------------------------------------')}`)
        this.log('')
        this.log(`${chalk.magenta('Download all the NPM Modules…')}`)
        this.log(`${chalk.yellow('Give me a moment to do that……')}`)
        this.log('')
        this.log(`${chalk.magenta('---------------------------------------------------------------------')}`)
    }

})

module.exports = dhBoilerplateGenerator
