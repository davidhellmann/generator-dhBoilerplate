/* -------------------------------------------------- */
/*    Install Craft CMS 3
/* -------------------------------------------------- */
const chalk = require('chalk')
const line = require('../../helpers/messages/_line')

const installCraftCMS3 = (context) => {
    context.log(line())
    context.log(`${chalk.magenta('  Download the latest Craft CMS 3 Version…')}`)
    context.log(`${chalk.yellow('  Give me a moment to do that……')}\n`)
    context.log(line())

    const done = context.async()
    context.spawnCommand('composer', ['create-project', 'craftcms/craft', '___dist', '-s', 'beta'])
        .on('close', done)
}

module.exports = installCraftCMS3
