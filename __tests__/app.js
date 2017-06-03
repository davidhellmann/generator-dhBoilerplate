'use strict';
/* eslint-disable new-cap */
var path = require('path')
var assert = require('yeoman-assert')
var helpers = require('yeoman-test')
const fs = require('fs')

// Define some variables
const project = {
    name: 'boilerplate-test',
    description: 'A small Test Driven Generator',
    version: '0.0.1',
    proxy: 'boilerplate-test.dev'
};
const author = {
    name: 'David Hellmann',
    email: 'davidhellmann.com@gmail.com',
    homepage: 'https://davidhellmann.com'
};

const run = () => helpers.run(path.join(__dirname, '../generators/app'))

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
    /*describe('Basic Files and Infos', () => {
        // Test package.json content
        it('fill package.json with correct Information', () => {
            assert.JSONFileContent('package.json', {
                name: project.name,
                description: project.description,
                version: project.version,
                authors: [{name: author.name, email: author.email, homepage: author.homepage}]
            })
        })

        // Fills config.json
        it('fills config.json with information', () => {
            assert.JSONFileContent('config.json', {
                proxy: project.proxy,
                favicon: {
                    developerURL: author.homepage,
                    developerName: author.name
                }
            })
        })

        it('fills config.json with project type information', async () => {
            await run()
                .withPrompts({
                    projectUsage: 'craft'
                });
            assert.JSONFileContent('config.json', {
                projectType: 'craft'
            })
        })

        it('adds javascript', () => {
            assert.file([
                'src/js/'
            ])
        })
    })

    describe('It is a Craft Project 🎉', () => {
        it('fills config.json with project type craft', async () => {
            await run()
                .withPrompts({
                    projectUsage: 'craft'
                });
            assert.JSONFileContent('config.json', {
                projectType: 'craft'
            })
        })

        it('adds craft templates to the src folder', () => {
            assert.file([
                'src/views/index.html',
                'src/views/layout/_layout.html',
                'src/views/parts/site-header.html',
                'src/views/parts/site-scripts.html'
            ])
        })
    })*/
})
