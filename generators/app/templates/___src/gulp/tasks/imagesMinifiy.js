import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import minifyImages from '../lib/imagesMinify';

const $ = gulpLoadPlugins();

const minifyImagesTask = () => {
  minifyImages(config.dist.images.bitmap.base + '**/*.{png,jpeg,jpg,gif,webp,ico}', config.dist.images.bitmap.base);
}

gulp.task('minify:images', minifyImagesTask);
module.exports = minifyImagesTask;
