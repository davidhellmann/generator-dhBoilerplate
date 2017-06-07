process.env.NODE_ENV = 'test'
/* eslint-disable new-cap */
const path = require('path')
const assert = require('yeoman-assert')
const helpers = require('yeoman-test')
const fs = require('fs-extra')

const run = () => helpers.run(path.join(__dirname, '../generators/app'))

describe('It is a Craft CMS Project, Yay!', () => {
    beforeAll(async () => {
        await run()
            .withPrompts({
                projectType: 'craftCMS'
            })
    })

    it('fills package.json with project type Craft CMS', async () => {
        assert.JSONFileContent('package.json', {
            projectType: 'craftCMS'
        })
    })

    it('adds craft templates to the src folder', () => {
        assert.file([
            '___src/templates/index.html',
            '___src/templates/_layouts/_master.html',
            '___src/templates/_partials/_header/_scripts.html',
            '___src/templates/_partials/_footer/_scripts.html'
        ])
    })
})

describe('it downloads craft & moves files', () => {
    beforeAll(async () => {
        await run()
            .withPrompts({
                projectType: 'craftCMS',
                craftCMSInstall: true
            })
    })

    it('CMS Files', () => {
        assert.file([
            '___dist/craft/'
        ])
    })

    it('adds environment file', () => {
        assert.file([
            '___dist/.env.php',
            '___dist/example.env.php',
            '___dist/craft/config/general.php'
        ])
    })
})
