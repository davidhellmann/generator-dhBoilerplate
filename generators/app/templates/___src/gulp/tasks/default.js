import gulp from 'gulp';
import runSequence from 'run-sequence';

const defaultTask = (cb) => {
  runSequence(
    [
      'browser-sync',
      'watch',
      'watch:js'
    ]
  )
}

gulp.task('default', defaultTask);
module.exports = defaultTask;
