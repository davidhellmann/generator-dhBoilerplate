import gulp from 'gulp';
import runSequence from 'run-sequence';

const svgTask = (cb) => {
  runSequence(
    [
      'svg-single',
      'svg-sprite',
    ],
    cb
  );
}

gulp.task('svg', svgTask);
module.exports = svgTask;
