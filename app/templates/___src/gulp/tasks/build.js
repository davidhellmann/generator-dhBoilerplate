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
      'minify:js',
      'minify:sass',
      'svg-cleanup'
    ],
    cb
  );
}

gulp.task('build', buildTask);
module.exports = buildTask;
