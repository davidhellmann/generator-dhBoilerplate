const extend = require('deep-extend')

function addBrowserlistSettings(files = {}) {
    extend(files.pkg, {
        browserslist: [
            '> 5%',
            'last 2 versions',
            'IE 11'
        ]
    })
}

module.exports = addBrowserlistSettings
