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
      'svg-sprite',
    ],
    cb
  )
}

gulp.task('init', initTask);
module.exports = initTask;
