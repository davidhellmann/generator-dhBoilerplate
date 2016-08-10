import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';

const $ = gulpLoadPlugins()

const copyFonts = () => {
  return gulp
    .src(config.src.fonts + '**/*.{ttf,woff,eof,svg,eot,woff2}')
    .pipe(gulp.dest(config.dist.fonts));
}

gulp.task('copy:fonts', copyFonts);

module.exports = { copyFonts }
