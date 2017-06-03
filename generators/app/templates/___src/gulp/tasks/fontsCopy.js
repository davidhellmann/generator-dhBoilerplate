import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';

const $ = gulpLoadPlugins()

// Overwrite the Changed Check
global.checkChanged = true

const copyFonts = () => {
  return gulp
    .src(config.src.fonts + '**/*.{ttf,woff,eof,svg,eot,woff2}')
    .pipe(global.checkChanged === true ? $.changed(config.dist.fonts) : gutil.noop())
    .pipe(gulp.dest(config.dist.fonts));
}

gulp.task('copy:fonts', copyFonts);

module.exports = { copyFonts }
