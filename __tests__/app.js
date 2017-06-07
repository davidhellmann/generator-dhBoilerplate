process.env.NODE_ENV = 'test'
/* eslint-disable new-cap */
const path = require('path')
const assert = require('yeoman-assert')
const helpers = require('yeoman-test')
const fs = require('fs-extra')

// Define some variables
const project = {
    name: 'awesome',
    description: 'A small Test Driven Generator',
    version: '0.0.1',
    proxy: 'awesome.dev',
    type: 'craftCMS'
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
                projectType: project.type,
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
                //'.gitignore',
                'gulpfile.babel.js',
                'package.json',
                'readme.md',
                '.stylelintrc',
                '.stylelintignore'
            ])
        })

        it('copies gulp tasks', () => {
            assert.file([
                'gulpfile.babel.js',
                'gulp/lib/',
                'gulp/tasks/',
                'gulp/tasks/browserSync.js'
            ])
        })

        /*it('initializes a git repository', () => {
            assert.file([
                '.git/'
            ])
        })*/
    })
})
