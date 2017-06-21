const extend = require('deep-extend')

function addBrowserSyncSettings(files = {}, context) {
    extend(files.pkg, {
        browsersync: {
            openbrowser: false,
            proxy: context.props.projectProxy
        }
    })
}

module.exports = addBrowserSyncSettings
