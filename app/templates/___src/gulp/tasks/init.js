import gulp from 'gulp';
import runSequence from 'run-sequence';

const initTask = (cb) => {
  runSequence(
    [
      'templates',
      'systemFiles',
      'modernizr',
      'compile:js',
      'sass',
      'copy:fonts',
      'images',
      'svg-single',
      'svg-cleanup',
    ],
    cb
  )
}

gulp.task('init', initTask);
module.exports = initTask;
