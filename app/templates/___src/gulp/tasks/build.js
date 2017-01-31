import gulp from 'gulp';
import runSequence from 'run-sequence';

const buildTask = (cb) => {
    runSequence(
        [
            'clean:templates',
            'clean:css',
            'clean:js',
            'clean:images',
        ],
        [
            'templates',
            'systemFiles',
            'modernizr',
            'compile:js',
            'sass',
            'copy:fonts',
            'images',
            'svg-single',
            'svg-sprite',
        ],
        [
            'combinemq:sass'
        ],
        [
            'minify:js',
            'minify:sass',
            'minify:images'
        ],
        cb
    );
}

gulp.task('build', buildTask);
module.exports = buildTask;
