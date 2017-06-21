const extend = require('deep-extend')

function addJquerySettings(files = {}) {
    extend(files.pkg, {
        dependencies: {
            jquery: '^3.0.0'
        },
        browser: {
            jquery: './node_modules/jquery/dist/jquery.js'
        }
    })
}

module.exports = addJquerySettings
