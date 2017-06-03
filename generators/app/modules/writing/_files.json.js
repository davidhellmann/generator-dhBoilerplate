const extend = require('deep-extend')

function filesJson(files = {}) {
    extend(files.pkg, {
        "files": {
            "systemFiles": [
                "___src/_system/.htaccess",
                "___src/_system/humans.txt",
                "___src/_system/robots.txt"
            ],
            "jsApp": {
                "srcName": "app.js",
                "distName": "app.min.js"
            }
        }
    })
}

module.exports = filesJson
