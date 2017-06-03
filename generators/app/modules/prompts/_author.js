// Importing message helper function
const message = require('../../helpers/prompts/_message')

const promptsAuthor = [
    {
        type: 'input',
        name: 'authorName',
        message: message({
            headline: 'Author Name',
            description: 'Please provide your name:',
            defaultValue: false
        }),
        store: true
    },
    {
        type: 'input',
        name: 'authorEmail',
        message: message({
            headline: 'Author E-Mail',
            description: 'Please provide your E-Mail:',
            defaultValue: false
        }),
        store: true
    },
    {
        type: 'input',
        name: 'authorHomepage',
        message: message({
            headline: 'Author Homepage',
            description: 'Note the Author Homepage:',
            defaultValue: false
        }),
        store: true
    }
]

module.exports = promptsAuthor
