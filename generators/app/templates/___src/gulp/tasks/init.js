import gulp from 'gulp'
import runSequence from 'run-sequence'

const initTask = (cb) => {
    runSequence(
        [
            'compile:templates',
            'copy:systemFiles',
            'modernizr',
            'compile:js',
            'compile:css',
            'copy:fonts',
            'create:inlineJS',
            'copy:images',
            'copy:svg-single',
            'create:svg-sprite',
            // 'create:favicons'
        ],
        cb
    )
}

gulp.task('init', initTask)
module.exports = initTask
