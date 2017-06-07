process.env.NODE_ENV = 'test'
/* eslint-disable new-cap */
const path = require('path')
const assert = require('yeoman-assert')
const helpers = require('yeoman-test')
const fs = require('fs-extra')

const run = () => helpers.run(path.join(__dirname, '../generators/app'))

describe('It is a WordPress Project, Yay!', () => {
    beforeAll(async () => {
        await run()
            .withPrompts({
                projectType: 'wordpress'
            })
    })

    it('fills package.json with project type WordPress', async () => {
        assert.JSONFileContent('package.json', {
            projectType: 'wordpress'
        })
    })

    it('adds WordPress templates to the src folder', () => {
        assert.file([
            '___src/templates/index.php',
            '___src/templates/header.php',
            '___src/templates/footer.php',
            '___src/templates/_partials/_header/_scripts.php',
            '___src/templates/_partials/_footer/_scripts.php'
        ])
    })
})


/*
describe('it downloads WordPress', () => {
    beforeAll(async () => {__
        await run()
            .withPrompts({
                projectType: 'wordpress',
                wordpressInstall: true
            })
    })

    it('If the user wants to it downloads WordPress', () => {
        assert.file([
            '___dist/'
        ])
    })
})
*/
