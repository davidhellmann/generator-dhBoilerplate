const extend = require('deep-extend')

function jqueryJson(files = {}) {
    extend(files.pkg, {
        "dependencies": {
            "jquery": "^3.0.0"
        },
        "browser": {
            "jquery": "./node_modules/jquery/dist/jquery.js"
        }
    })
}

module.exports = jqueryJson
