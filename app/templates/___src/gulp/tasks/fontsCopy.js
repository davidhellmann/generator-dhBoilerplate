/**
 * Copy Fonts
 * Copy all Fonts from the SRC to the DIST Folder.
 */

import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';

const $ = gulpLoadPlugins()

const copyFonts = () => {
  return gulp
    .src(config.src.fonts + '**/*.{ttf,woff,eof,svg,eot,woff2}')
    .pipe($.changed(config.dist.fonts))
    .pipe(gulp.dest(config.dist.fonts))
    .pipe($.notify({
      onLast: true,
      message: '>>> Task: copy:fonts - done'
    }));
}

gulp.task('copy:fonts', copyFonts);

module.exports = { copyFonts }
