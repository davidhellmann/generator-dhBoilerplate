// Import some prompt modules
const promptsAuthor = require('./prompts/_author')
const promptsCraftCMS = require('./prompts/_craftCMS')
const promptsCraftCMSBeta = require('./prompts/_craftCMSBeta')
const promptsProject = require('./prompts/_project')
const promptsWordPress = require('./prompts/_wordpress')

function prompts() {
    return [
        ...promptsAuthor,
        ...promptsCraftCMS,
        ...promptsCraftCMSBeta,
        ...promptsProject,
        ...promptsWordPress
    ]
}

module.exports = prompts
