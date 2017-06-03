import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import errorHandler from '../lib/errorHandler';

const $ = gulpLoadPlugins();

const vectorSource = config.src.images.svg.single + '**/*.svg';
const vectorDist = config.dist.images.svg.single;

// Overwrite the Changed Check
global.checkChanged = true

const copyVectors = () => {
  return gulp
    .src(vectorSource)
    //.pipe($.changed(vectorDist))
    .pipe($.imagemin({
      svgoPlugins:  config.minify.images.svgoPlugins
    }))
    .on('error', errorHandler)
    .pipe(global.checkChanged === true ? $.changed(vectorDist) : gutil.noop())
    .pipe(gulp.dest(vectorDist))
    .pipe($.size())
    .pipe($.rename({
      <% if (projectUsage == 'WordPress' ) { %>
      extname: ".svg.php"
      <% } else { %>
      extname: ".svg.html"
      <% } %>
    }))
    .pipe(gulp.dest(config.src.images.svg.single + 'inline/'))
    .pipe(gulp.dest(vectorDist + 'inline/'))
    .pipe(gulp.dest(config.src.templates + '_svg/'))
    .pipe(gulp.dest(config.dist.markup + '_svg/'));
}

gulp.task('svg-single', copyVectors);
module.exports = copyVectors;
