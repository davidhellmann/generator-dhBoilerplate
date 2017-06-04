const extend = require('deep-extend')

function browserSyncJson(files = {}) {
    extend(files.pkg, {
        browsersync: {
            openbrowser: false,
            proxy: this.props.projectProxy
        }
    })
}

module.exports = browserSyncJson
