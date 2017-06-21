const chalk = require('chalk')

const logMessage = ({
                        message = 'Logging',
                        color = 'magenta',
                        short = true,
                        sign = '·',
                        count = 95
                    } = {}) => {
    // Stuff from Martin. Finalize this later or never. Unit tests…
    if (process.env.NODE_ENV === 'test') {
        return
    }

    // Set Vars
    const signs = Array(count + 1).join(sign)
    let consoleMessage = ''

    if (short) {
        consoleMessage = `\n${chalk[color].bold(`  [--- ${message} ---]`)}\n`
    } else {
        consoleMessage = `\n\n${chalk[color].bold(`  ${message}`)}\n${chalk[color].bold(`  ${signs}`)}\n`
    }
    if (this.log) {
        return this.log(consoleMessage)
    }
    console.log(consoleMessage) // eslint- disable
}

module.exports = logMessage
