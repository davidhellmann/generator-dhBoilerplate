import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import errorHandler from '../lib/errorHandler';

const $ = gulpLoadPlugins();

const copyImagesLib = (srcFiles, distFiles) => {
  return gulp
    .src(srcFiles)
    .on('error', errorHandler)
    .pipe(gulp.dest(distFiles));
}

module.exports = copyImagesLib;
