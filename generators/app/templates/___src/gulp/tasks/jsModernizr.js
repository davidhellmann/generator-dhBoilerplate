import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'
import pkg from '../../package.json'

const $ = gulpLoadPlugins()

const buildModernizr = () => {
  return gulp
    .src([
      `${pkg.src.css}**/*.scss`,
      `${pkg.src.js}**/*.js`
    ])
    .pipe($.modernizr({
      crawl: true,
      excludeTests: pkg.modernizr.excludeTests,
      options: pkg.modernizr.options,
      tests: pkg.modernizr.tests
    }))
    .pipe($.uglify())
    .pipe($.rename({
      suffix: `-custom.min`
    }))
    .pipe(gulp.dest(`${pkg.dist.js}vendor/`))
}

gulp.task('modernizr', buildModernizr)
module.exports = buildModernizr
