import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'
import pkg from '../../package.json'
import errorHandler from '../lib/errorHandler'

const $ = gulpLoadPlugins()

const vectorSource = `${pkg.src.images.svg.single}**/*.svg`
const vectorDist = pkg.dist.images.svg.single

// Overwrite the Changed Check
global.checkChanged = true

const copyVectors = () => {
  return gulp
    .src(vectorSource)
    //.pipe($.changed(vectorDist))
    .pipe($.imagemin({
      svgoPlugins:  pkg.minify.images.svgoPlugins
    }))
    .on('error', errorHandler)
    .pipe(global.checkChanged === true ? $.changed(vectorDist) : gutil.noop())
    .pipe(gulp.dest(vectorDist))
    .pipe($.size())
    .pipe($.rename({
      <% if (projectType === 'wordpress' ) { %>
      extname: ".svg.php"
      <% } else { %>
      extname: ".svg.html"
      <% } %>
    }))
    .pipe(gulp.dest(pkg.src.images.svg.single + 'inline/'))
    .pipe(gulp.dest(vectorDist + 'inline/'))
    .pipe(gulp.dest(pkg.src.templates + '_svg/'))
    .pipe(gulp.dest(pkg.dist.markup + '_svg/'));
}

gulp.task('copy:svg-single', copyVectors)
module.exports = copyVectors
