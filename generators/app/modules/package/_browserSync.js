const extend = require('deep-extend')

function addBrowserSyncSettings(files = {}) {
    extend(files.pkg, {
        browsersync: {
            openbrowser: false,
            proxy: this.props.projectProxy
        }
    })
}

module.exports = addBrowserSyncSettings
