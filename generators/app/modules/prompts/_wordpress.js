// Importing message & when helper function
const commandExists = require('command-exists').sync
const message = require('../../helpers/prompts/_message')
const when = require('../../helpers/prompts/_when')

// Check if wp is installed
const isWp = commandExists('wp')

const promptsWordpress = [
    {
        when: when('wordpress', isWp),
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
