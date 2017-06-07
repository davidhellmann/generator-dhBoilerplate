import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'
import pkg from '../../package.json'

const $ = gulpLoadPlugins()

const minifyJsTask = () => {
  return gulp
    .src(`${pkg.dist.js}*.js`)
    .pipe($.uglify())
    .pipe(gulp.dest(pkg.dist.js))
}

gulp.task('minify:js', minifyJsTask)
module.exports = minifyJsTask
