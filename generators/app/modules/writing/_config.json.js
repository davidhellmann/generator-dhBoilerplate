const extend = require('deep-extend')

function basePackageJson(files = {}) {
    extend(files.config, {
        proxy: this.props.projectProxy,
        projectType: this.props.projectUsage,
        favicons: {
            appName: this.props.projectName,
            appDescription: this.props.projectDescription,
            version: this.props.projectVersion,
            url: this.props.projectProxy,
            developerName: this.props.authorName,
            developerURL: this.props.authorHomepage
        }
    })
}

module.exports = basePackageJson
