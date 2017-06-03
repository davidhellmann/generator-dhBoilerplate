import gulp from 'gulp';
import runSequence from 'run-sequence';

const svgTask = (cb) => {
  runSequence(
    [
      'copy:svg-single',
      'create:svg-sprite',
    ],
    cb
  )
}

gulp.task('copy:svg', svgTask)
module.exports = svgTask
