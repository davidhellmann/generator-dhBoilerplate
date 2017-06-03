// Importing message helper function
const chalk = require('chalk')
const message = require('../../helpers/prompts/_message')

const promptsProject = [
    {
        type: 'input',
        name: 'projectName',
        message: message({
            headline: 'Project Name',
            description: 'Please provide a Project Name (without-spaces):',
            defaultValue: 'Current Name:'
        }),
        default() {
            return process.cwd()
                .split('/')
                .pop(-1)
                .toLowerCase()
                .replace(/\s/g, '')
        },
        validate(input) {
            // Do async stuff
            if (input.indexOf(' ') >= 0 || /[~`!#$%^&*+=[\]\\';,/{}|\\":<>?]/g.test(input)) {
                // Pass the return value in the done callback
                console.log(`\n${chalk.styles.red.open}No whitespaces or special-chars allowed!${chalk.styles.red.close}`)
                return false
            }
            return true
        },
        store: true
    },
    {
        type: 'input',
        name: 'projectDescription',
        message: message({
            headline: 'Project Description',
            description: 'Please provide a description for your project:',
            defaultValue: 'Current Description:'
        }),
        store: true
    },
    {
        type: 'input',
        name: 'projectVersion',
        message: message({
            headline: 'Project Version',
            description: 'Define a Project Version:'
        }),
        default: '0.0.1',
        store: true
    },
    {
        type: 'input',
        name: 'projectProxy',
        message: message({
            headline: 'Project Proxy Domain',
            description: 'Define a Project Proxy Domain or set it to "false". Default is your Project Name:'
        }),
        default(answers) {
            // If the Answer includes .dev or .local
            if (answers.projectName.includes('.dev') || answers.projectName.includes('.local')) {
                return answers.projectName
            }
            // If false
            if (answers.projectName === false) {
                return false
            }
            return `${answers.projectName}.dev`
        },
        store: true
    },
    {
        type: 'list',
        name: 'projectType',
        message: message({
            headline: 'Project Type',
            description: 'Choose your Project Type:',
            defaultValue: false
        }),
        choices: [
            {
                name: 'Craft CMS',
                value: 'craftCMS'
            },
            {
                name: 'Craft CMS Beta',
                value: 'craftCMSBeta'
            },
            {
                name: 'Prototyping',
                value: 'prototyping'
            },
            {
                name: 'WordPress',
                value: 'wordpress'
            },
            /*
            {
                name: 'Vue Application',
                value: 'vueApp'
            }
            */
        ],
        store: true
    },
    {
        type: 'confirm',
        name: 'projectjQuery',
        message: message({
            headline: 'Project jQuery',
            description: 'Do you want to use jQuery (newest Version)?'
        }),
        default: false,
        store: true
    },
    {
        type: 'confirm',
        name: 'projectVue',
        message: message({
            headline: 'Project VueJS',
            description: 'Do you want to use Vue.js?'
        }),
        default: false,
        store: true
    }
]

module.exports = promptsProject
