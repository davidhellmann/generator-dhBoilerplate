// Importing message & when helper function
const message = require('../../helpers/prompts/_message')
const when = require('../../helpers/prompts/_when')

const promptsCraftCMS = [
    {
        when: when('craftCMS'),
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
