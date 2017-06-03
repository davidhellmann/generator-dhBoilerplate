/* -------------------------------------------------- */
/*    Install Craft CMS
 /* -------------------------------------------------- */
const chalk = require('chalk')

const installCraftCMS = (context) => {
    context.log(`${chalk.magenta(`-----------------------------------------------------------------------------------------------`)}\n`)
    context.log(`${chalk.magenta('  Download the latest Craft CMS Version…')}`)
    context.log(`${chalk.yellow('  Give me a moment to do that……')}`)
    context.log(`${chalk.magenta(`-----------------------------------------------------------------------------------------------`)}\n`)
    const done = context.async()
    const self = context

    context.spawnCommand(`wget`, [`http://buildwithcraft.com/latest.tar.gz\?accept_license\=yes`]).on('close', () => {
        self.spawnCommand(`mkdir`, [`___dist`]).on('close', () => {
            self.spawnCommand(`tar`, [`-zxvf`, `latest.tar.gz\?accept_license=yes`, `craft/`]).on('close', () => {
                self.spawnCommand(`rm`, [`-rf`, `latest.tar.gz\?accept_license=yes`]).on('close', done)
            })
        })
    })
}

module.exports = installCraftCMS
