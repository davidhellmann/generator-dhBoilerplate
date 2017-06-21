// Importing message helper function
const message = require('../../helpers/prompts/_message')
const when = require('../../helpers/prompts/_when')

const promptsModule = [
    {
        type: 'input',
        name: 'moduleName',
        message: message({
            headline: 'Module Name',
            description: 'Please provide your name:',
            defaultValue: false
        }),
        default: "example",
        validate(input) {
            // Do async stuff
            if (input.indexOf(' ') >= 0) {
                // Pass the return value in the done callback
                return `${chalk.styles.red.open}
No whitespaces allowed!${chalk.styles.red.close}`
            }
            return true
        }
    },
    {
        type: 'checkbox',
        name: "moduleFiles",
        message: "What files do you need?",
        choices: [
            {
                name: 'JavaScript File (_main.js)',
                value: 'js',
                checked: true
            }, {
                name: 'Sass File (_style.scss)',
                value: 'css',
                checked: true
            }, {
                name: 'Template File (_template.html)',
                value: 'template',
                checked: true
            }]
    },
    {
        type: 'list',
        name: "templateExtension",
        message: "Do you prefer HTML or Twig?",
        choices: ['.html', '.twig'],
        default: '.html'
    }
]


module.exports = promptsModule
