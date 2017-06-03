const extend = require('deep-extend')

function faviconsJson(files = {}) {
    extend(files.pkg, {
        favicons: {
            appName: this.props.projectName,
            appDescription: this.props.projectDescription,
            version: this.props.projectVersion,
            url: this.props.projectProxy,
            developerName: this.props.authorName,
            developerURL: this.props.authorHomepage,
            "srcImage": "_favicon.png",
            "background": "#000000",
            "display": "standalone",
            "orientation": "portrait",
            "logging": false,
            "online": false,
            "icons": {
                "android": true,
                "appleIcon": true,
                "appleStartup": true,
                "coast": true,
                "favicons": true,
                "firefox": true,
                "opengraph": false,
                "twitter": false,
                "windows": true,
                "yandex": false
            }
        }
    })
}

module.exports = faviconsJson
