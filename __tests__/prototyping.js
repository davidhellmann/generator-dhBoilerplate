process.env.NODE_ENV = 'test'
/* eslint-disable new-cap */
const path = require('path')
const assert = require('yeoman-assert')
const helpers = require('yeoman-test')
const fs = require('fs-extra')

const run = () => helpers.run(path.join(__dirname, '../generators/app'))

describe('It is a Prototyping Project, Yay!', () => {
    beforeAll(async () => {
        await run()
            .withPrompts({
                projectType: 'prototyping'
            })
    })

    it('fills package.json with project type Prototyping', async () => {
        assert.JSONFileContent('package.json', {
            projectType: 'prototyping'
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
