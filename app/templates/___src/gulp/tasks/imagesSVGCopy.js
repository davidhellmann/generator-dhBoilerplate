import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import errorHandler from '../lib/errorHandler';

const $ = gulpLoadPlugins();

const vectorSource = config.src.images.svg.single + '**/*.svg';
const vectorDist = config.dist.images.svg.single;

const copyVectors = () => {
  return gulp
    .src(vectorSource)
    //.pipe($.changed(vectorDist))
    .pipe($.imagemin({
      svgoPlugins:  config.minify.images.svgoPlugins
    }))
    .on('error', errorHandler)
    .pipe(gulp.dest(vectorDist))
    .pipe($.size());
}

gulp.task('svg-single', copyVectors);
module.exports = copyVectors;
