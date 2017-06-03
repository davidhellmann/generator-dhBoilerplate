const extend = require('deep-extend')

function cssJson(files = {}) {
    extend(files.pkg, {
        css: {
            sourcemap: true
        }
    })
}

module.exports = cssJson
