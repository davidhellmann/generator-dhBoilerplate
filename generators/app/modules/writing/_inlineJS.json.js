const extend = require('deep-extend')

function inlineJSJson(files = {}) {
    extend(files.pkg, {
        inlineJS: [
            './node_modules/fg-loadcss/src/loadCSS.js',
            './node_modules/fg-loadcss/src/cssrelpreload.js'
        ]
    })
}

module.exports = inlineJSJson
