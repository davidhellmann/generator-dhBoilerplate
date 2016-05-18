import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import minifyImages from '../lib/imagesMinify';

const $ = gulpLoadPlugins();

const minifyImagesTask = () => {
  minifyImages(config.dist.images + '**/*.{png,jpeg,jpg,gif,webp,ico}', config.dist.images);
}

gulp.task('minify:images', minifyImagesTask);
module.exports = minifyImagesTask;
