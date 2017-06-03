import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'
import pkg from '../../package.json'
import postCssNano from '../lib/postCssNano'

const $ = gulpLoadPlugins()

const minifyCss = () => {
  return gulp
    .src(`${pkg.dist.css}*.css`)
    .pipe($.postcss(postCssNano()))
    .pipe(gulp.dest(pkg.dist.css))
}

gulp.task('minify:sass', minifyCss)
module.exports = minifyCss
