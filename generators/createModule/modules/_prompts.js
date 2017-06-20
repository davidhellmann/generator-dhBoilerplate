// Import some prompt modules
const promptsModule = require('./prompts/_module')

function prompts() {
    return [
        ...promptsModule,
    ]
}

module.exports = prompts
