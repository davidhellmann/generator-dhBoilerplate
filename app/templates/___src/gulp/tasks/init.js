import gulp from 'gulp';
import runSequence from 'run-sequence';

const initTask = (cb) => {
  runSequence(
    'templates',
    'systemFiles',
    'modernizr',
    'compile:js',
    'minify:js',
    'sass',
    'minify:sass',
    'copy:fonts',
    'images',
    'svg-single',
    'svg-sprite',
    'svg-cleanup',
    cb
  )
}

gulp.task('init', initTask);
module.exports = initTask;
