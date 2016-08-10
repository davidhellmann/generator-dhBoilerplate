import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import copyImagesLib from '../lib/imagesCopy';

const $ = gulpLoadPlugins();

const copyImages = () => {
  copyImagesLib(config.src.images.bitmap.base + '**/*.{png,jpeg,jpg,gif,webp,ico}', config.dist.images.bitmap.base);
}

gulp.task('images', copyImages);
module.exports = copyImages;
