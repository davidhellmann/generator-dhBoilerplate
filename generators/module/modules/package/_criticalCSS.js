const extend = require('deep-extend')

function addCriticalCSSSettings(files = {}) {
    extend(files.pkg, {
        criticalCSS: [
            { url: '', template: 'index' },
            { url: '/NEWS/ENTRY-SLUG', template: 'news/_entry' },
            { url: '/NEWS', template: 'news/index' },
            { url: '/404', template: '404' }
        ]
    })
}

module.exports = addCriticalCSSSettings
