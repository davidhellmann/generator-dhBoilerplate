import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import postCssNano from '../lib/postCssNano';

const $ = gulpLoadPlugins();

const minifyCss = () => {
  return gulp
    .src(config.dist.css + '*.css')
    .pipe($.postcss(postCssNano()))
    .pipe(gulp.dest(config.dist.css));
}

gulp.task('minify:sass', minifyCss);
module.exports = minifyCss;
