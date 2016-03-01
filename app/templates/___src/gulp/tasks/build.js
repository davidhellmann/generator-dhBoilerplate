/**
 * Starting the first Build
 **/

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
      'minify:js',
      'sass',
      'minify:sass',
      'copy:fonts',
      'images',
      'svg-single',
      'svg-sprite',
      'svg-cleanup'
    ],
    cb
  );
}

gulp.task('build', buildTask);
module.exports = buildTask;
