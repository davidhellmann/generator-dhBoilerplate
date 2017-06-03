const extend = require('deep-extend')

function crititalCSSJson(files = {}) {
    extend(files.pkg, {
        criticalCSS: [
            { url: '', template: 'index' },
            { url: '/NEWS/ENTRY-SLUG', template: 'news/_entry' },
            { url: '/NEWS', template: 'news/index' },
            { url: '/404', template: '404' }
        ]
    })
}

module.exports = crititalCSSJson
