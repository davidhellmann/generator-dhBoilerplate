/* -------------------------------------------------- */
/*    Install WordPress
/* -------------------------------------------------- */
const chalk = require('chalk')

const installWordpress = (context) => {
    context.log(`${chalk.magenta(`  -----------------------------------------------------------------------------------------------`)}\n`)
    context.log(`${chalk.magenta('  Download the latest WordPress Version…')}`)
    context.log(`${chalk.yellow('  Give me a moment to do that……')}\n`)
    context.log(`${chalk.magenta(`  -----------------------------------------------------------------------------------------------`)}\n`)

    const done = context.async()
    context.spawnCommand('wp', ['core', 'download', '--path=___dist']).on('close', done)
}

module.exports = installWordpress
