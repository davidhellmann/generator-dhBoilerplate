// Import some prompt modules
const promptsAuthor = require('./prompts/_author')
const promptsCraftCMS = require('./prompts/_craftCMS')
const promptsCraftCMS3 = require('./prompts/_craftCMS3')
const promptsProject = require('./prompts/_project')
const promptsWordPress = require('./prompts/_wordpress')

function prompts() {
    return [
        ...promptsProject,
        ...promptsCraftCMS,
        ...promptsCraftCMS3,
        ...promptsWordPress,
        ...promptsAuthor
    ]
}

module.exports = prompts
