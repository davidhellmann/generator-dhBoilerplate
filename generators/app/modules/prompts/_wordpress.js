// Importing message & when helper function
const message = require('../../helpers/prompts/_message')
const when = require('../../helpers/prompts/_when')

const promptsWordpress = [
    {
        when: when('wordpress'),
        type: 'confirm',
        name: 'wordpressInstall',
        message: message({
            headline: 'WordPress Installation',
            description: 'Do you want to download the latest WordPress Version via WP-CLI?'
        }),
        default: true
    }
]

module.exports = promptsWordpress
