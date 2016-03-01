import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import _copyImages from '../lib/imagesCopy';

const $ = gulpLoadPlugins();

const copyImages = () => {
  _copyImages(config.src.images + '**/*.{png,jpeg,jpg,gif,webp}', config.dist.images);
}

gulp.task('images', copyImages);
module.exports = copyImages;
