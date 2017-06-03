import config from '../../config.json'
import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()

const minifyJsTask = () => {
  return gulp
    .src(config.dist.js + '*.js')
    .pipe($.uglify())
    .pipe(gulp.dest(config.dist.js))
}

gulp.task('minify:js', minifyJsTask)
module.exports = minifyJsTask
