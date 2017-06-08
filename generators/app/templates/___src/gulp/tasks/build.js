import gulp from 'gulp'
import runSequence from 'run-sequence'

const buildTask = (cb) => {
    runSequence(
        [
            'clean:templates',
            'clean:css',
            'clean:js',
            'clean:images',
        ],
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
        ],
        [
            'minify:js',
            'minify:sass',
            'minify:images'
        ],
        cb
    );
}

gulp.task('build', buildTask)
module.exports = buildTask
