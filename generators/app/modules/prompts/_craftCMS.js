// Importing message & when helper function
const commandExists = require('command-exists').sync
const message = require('../../helpers/prompts/_message')
const when = require('../../helpers/prompts/_when')

// Check if Wget is installed
const isWget = commandExists('wget')

const promptsCraftCMS = [
    {
        when: when('craftCMS', isWget),
        type: 'confirm',
        name: 'craftCMSInstall',
        message: message({
            headline: 'Craft CMS Installation',
            description: 'Do you want to download the newest Craft Version via WGET?'
        }),
        default: true
    }
]

module.exports = promptsCraftCMS
