/* -------------------------------------------------- */
/*    Install Craft CMS
 /* -------------------------------------------------- */
const chalk = require('chalk')
const line = require('../../helpers/messages/_line')

const installCraftCMS = (context) => {
    context.log(line())
    context.log(`${chalk.magenta(`  Download the latest Craft CMS Version…`)}`)
    context.log(`${chalk.yellow(`  Give me a moment to do that……`)}\n`)
    context.log(line())

    const done = context.async()
    const self = context
    /* eslint-disable */
    context.spawnCommand('wget', ['http://buildwithcraft.com/latest.tar.gz?accept_license=yes']).on('close', () => {
        self.spawnCommand('mkdir', ['___dist']).on('close', () => {
            self.spawnCommand('tar', ['-zxvf', 'latest.tar.gz?accept_license=yes', 'craft/']).on('close', () => {
                self.spawnCommand('mv', ['craft', '___dist/']).on('close', () => {
                    self.spawnCommand('rm', ['-rf', 'latest.tar.gz?accept_license=yes']).on('close', done)
                    self.spawnCommand('rm', ['-rf', '___dist/craft/config/db.php']).on('close', done)
                    self.spawnCommand('rm', ['-rf', '___dist/craft/config/general.php']).on('close', done)
                })
            })
        })
    })
    /* eslint-enable */
}

module.exports = installCraftCMS
