const extend = require('deep-extend')

function addModernizrSettings(files = {}) {
    extend(files.pkg, {
        modernizr: {
            excludeTests: [
                'hidden'
            ],
            options: [
                'setClasses',
                'addTest',
                'fnBind'
            ],
            tests: [
                'backgroundblendmode',
                'bgsizecover',
                'touchevents',
                'rgba'
            ]
        }
    })
}

module.exports = addModernizrSettings
