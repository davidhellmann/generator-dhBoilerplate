// Importing message & when helper function
const message = require('../../helpers/prompts/_message')
const when = require('../../helpers/prompts/_when')

const promptsCraftCMS3 = [
    {
        when: when('craftCMS3'),
        type: 'confirm',
        name: 'craftCMS3Install',
        message: message({
            headline: 'Craft CMS 3 Installation',
            description: 'Do you want to install the Craft 3 Beta version via Composer?'
        }),
        default: true
    }
]

module.exports = promptsCraftCMS3
