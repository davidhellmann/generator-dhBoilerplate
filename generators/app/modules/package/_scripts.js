const extend = require('deep-extend')

function addNPMScripts(files = {}) {
    extend(files.pkg, {
        scripts: {
            start: 'gulp init',
            dev: 'gulp',
            build: 'gulp build',
            module: 'node scripts/module.js',
            'clean:dist': 'gulp clean:dist',
            'clean:templates': 'gulp clean:templates',
            'clean:images': 'gulp clean:images',
            'clean:js': 'gulp clean:js',
            'clean:css': 'gulp clean:css',
            'copy:fonts': 'gulp copy:fonts',
            'copy:images': 'gulp \'copy:images',
            'copy:svg': 'gulp copy:svg',
            'copy:svg-single': 'gulp copy:svg-single',
            'create:svg-sprite': 'gulp create:svg-sprite',
            'copy:systemFiles': 'gulp copy:systemFiles',
            'compile:css': 'gulp compile:css',
            'compile:js': 'gulp compile:js',
            'compile:templates': 'gulp compile:templates',
            'create:criticalcss': 'gulp create:criticalcss',
            'create:favicons': 'gulp create:favicons',
            'create:inlineJS': 'gulp create:inlineJS'
        }
    })
}

module.exports = addNPMScripts
