const extend = require('deep-extend')

function modernizrJson(files = {}) {
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

module.exports = modernizrJson
