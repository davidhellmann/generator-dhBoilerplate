import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins'
import pkg from '../../package.json';

const $ = gulpLoadPlugins()

// Overwrite the Changed Check
global.checkChanged = true

const copyFonts = () => {
  return gulp
    .src(`${pkg.src.fonts}**/*.{ttf,woff,eof,svg,eot,woff2}`)
    .pipe(global.checkChanged === true ? $.changed(pkg.dist.fonts) : gutil.noop())
    .pipe(gulp.dest(pkg.dist.fonts))
}

gulp.task('copy:fonts', copyFonts)
module.exports = copyFonts
