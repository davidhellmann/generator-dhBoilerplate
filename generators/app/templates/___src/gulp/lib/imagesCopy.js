import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'
import errorHandler from '../lib/errorHandler'

const $ = gulpLoadPlugins()

// Overwrite the Changed Check
global.checkChanged = true

const copyImagesLib = (srcFiles, distFiles) => {
  return gulp
    .src(srcFiles)
    .on('error', errorHandler)
    .pipe(global.checkChanged === true ? $.changed(distFiles) : gutil.noop())
    .pipe(gulp.dest(distFiles))
}

module.exports = copyImagesLib
