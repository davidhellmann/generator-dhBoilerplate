const extend = require('deep-extend')

function basePackageJson(files = {}) {
    extend(files.config, {
        proxy: this.props.projectProxy,
        projectType: this.props.projectUsage,
        favicon: {
            developerName: this.props.authorName,
            developerURL: this.props.authorHomepage
        }
    })
}

module.exports = basePackageJson
