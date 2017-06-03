// Importing message & when helper function
const commandExists = require('command-exists')
const message = require('../../helpers/prompts/_message')
const when = require('../../helpers/prompts/_when')

// Check if Wget is installed
let wp_cli = false
commandExists('wp')
    .then((command) => {
        wp_cli = true
    })
    .catch(() => {
        wp_cli = false
    })

const promptsWordpress = [
    {
        when: when('wordpress' && wp_cli),
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
