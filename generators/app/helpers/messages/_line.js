const chalk = require('chalk')

const line = (sign = '·', count = 95) => {

    const signs = Array(count + 1).join(sign)
    return `${chalk.magenta.bold(`  ${signs}`)}\n`
}

module.exports = line
