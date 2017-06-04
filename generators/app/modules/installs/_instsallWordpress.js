/* -------------------------------------------------- */
/*    Install WordPress
/* -------------------------------------------------- */
const chalk = require('chalk')
const line = require('../../helpers/messages/_line')

const installWordpress = (context) => {
    context.log(line())
    context.log(`${chalk.magenta('  Download the latest WordPress Version…')}`)
    context.log(`${chalk.yellow('  Give me a moment to do that……')}\n`)
    context.log(line())

    const done = context.async()
    context.spawnCommand('wp', ['core', 'download', '--path=___dist']).on('close', done)
}

module.exports = installWordpress
