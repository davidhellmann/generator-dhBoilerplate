const extend = require('deep-extend')

function addCSSSettings(files = {}) {
    extend(files.pkg, {
        css: {
            sourcemap: true
        }
    })
}

module.exports = addCSSSettings
