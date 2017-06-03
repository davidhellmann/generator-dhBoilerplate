// Importing message & when helper function
const commandExists = require('command-exists')
const message = require('../../helpers/prompts/_message')
const when = require('../../helpers/prompts/_when')

// Check if Wget is installed
let composer = false
commandExists('composer')
    .then((command) => {
        composer = true
    })
    .catch(() => {
        composer = false
    })

const promptsCraftCMS3 = [
    {
        when: when('CraftCMS3' && composer),
        type: 'confirm',
        name: 'CraftCMS3Install',
        message: message({
            headline: 'Craft CMS Beta Installation',
            description: 'Do you want to install the Craft 3 Beta version via Composer?'
        }),
        default: true
    }
]

module.exports = promptsCraftCMS3
