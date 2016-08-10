import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';

const $ = gulpLoadPlugins();

const buildModernizr = () => {
  return gulp
    .src([
      config.src.css  + '**/*.scss',
      config.src.js   + '**/*.js'
    ])
    .pipe($.modernizr({
      crawl: true,
      excludeTests: config.modernizr.excludeTests,
      options: config.modernizr.options,
      tests: config.modernizr.tests
    }))
    .pipe($.uglify())
    .pipe($.rename({
      suffix: '-custom.min'
    }))
    .pipe(gulp.dest(config.dist.js + 'vendor/'));
}

gulp.task('modernizr', buildModernizr);
module.exports = buildModernizr;
