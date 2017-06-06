process.env.NODE_ENV = 'test'
/* eslint-disable new-cap */
const path = require('path')
const assert = require('yeoman-assert')
const helpers = require('yeoman-test')
const fs = require('fs-extra')

// Define some variables
const project = {
    name: 'boilerplate-test',
    description: 'A small Test Driven Generator',
    version: '0.0.1',
    proxy: 'boilerplate-test.dev'
}
const author = {
    name: 'David Hellmann',
    email: 'davidhellmann.com@gmail.com',
    homepage: 'https://davidhellmann.com'
}

const run = () => helpers.run(path.join(__dirname, '../generators/app'))
/* eslint-disable */
describe('dh-boilerplate', () => {
    beforeAll(() => {
        return run()
            .withPrompts({
                projectName: project.name,
                projectVersion: project.version,
                projectDescription: project.description,
                projectProxy: project.proxy,
                authorName: author.name,
                authorEmail: author.email,
                authorHomepage: author.homepage
            })
    })

    // Test for Basic Files
    describe('Basic Files and Infos', () => {
        // Test package.json content
        it('fill package.json with correct Information', () => {
            assert.JSONFileContent('package.json', {
                name: project.name,
                description: project.description,
                version: project.version,
                authors: [{name: author.name, email: author.email, homepage: author.homepage}]
            })
        })

        it('adds files for all projects', () => {
            assert.file([
                '.babelrc',
                '.editorconfig',
                '.eslintignore',
                '.eslintrc',
                '.jshintrc',
                '.gitignore',
                'gulpfile.babel.js',
                'package.json',
                'readme.md',
                '.stylelintrc',
                '.stylelintignore'
            ])
        })

        it('copy javascript files', () => {
            assert.file([
                '___src/assets/js/'
            ])
        })

        it('copies gulp tasks', () => {
            assert.file([
                'gulpfile.babel.js',
                '___src/gulp/lib/',
                '___src/gulp/tasks/',
                '___src/gulp/tasks/browserSync.js'
            ])
        })

        it('copies image files', () => {
            assert.file([
                '___src/assets/images/'
            ])
        })

        it('copies font files', () => {
            assert.file([
                '___src/assets/fonts/'
            ])
        })

        it('copies data files', () => {
            assert.file([
                '___src/_data/'
            ])
        })

        it('copies import files', () => {
            assert.file([
                '___src/_imports/'
            ])
        })

        it('copies system files', () => {
            assert.file([
                '___src/_system/'
            ])
        })
    })
})
