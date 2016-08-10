import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import gutil from 'gulp-util';
import errorHandler from '../lib/errorHandler';
import source from 'vinyl-source-stream';
import buffer from 'vinyl-buffer';
import yargs from 'yargs';

const argv = yargs.argv
const $ = gulpLoadPlugins();

const env = argv.env || 'development'

const bundleJs = (bundler) => {
  return bundler.bundle()
    .on('error', errorHandler)
    .pipe(source(config.files.jsApp.srcName))
    .pipe(buffer())
    .pipe(env == 'development' ? $.sourcemaps.init({loadMaps: true}) : $.util.noop())
    .pipe(env == 'production' ? $.uglify() : $.util.noop())
    .pipe($.rename({ suffix: '.min'}))
    .pipe(env == 'development' ? $.sourcemaps.write('./maps/') : $.util.noop())
    .pipe(gulp.dest(config.dist.js));
}

module.exports = bundleJs;
