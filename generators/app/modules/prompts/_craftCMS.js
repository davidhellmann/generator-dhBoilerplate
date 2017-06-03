// Importing message & when helper function
const commandExists = require('command-exists')
const message = require('../../helpers/prompts/_message')
const when = require('../../helpers/prompts/_when')

// Check if Wget is installed
let wget = false
commandExists('wget --help')
    .then((command) => {
        wget = true
    })
    .catch(() => {
        wget = false
    })

const promptsCraftCMS = [
    {
        when: when('craftCMS' && wget),
        type: 'confirm',
        name: 'craftCMSInstall',
        message: message({
            headline: 'Craft CMS Installation',
            description: 'Do you want to download the newest Craft Version via WGET?'
        }),
        default: true,
        store: true
    }
]

module.exports = promptsCraftCMS
