import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import pngquant from 'imagemin-pngquant';
import jpegCompress from 'imagemin-jpeg-recompress';

const $ = gulpLoadPlugins();

const minifyImages = (srcFiles, distFiles) => {
  return gulp
    .src(srcFiles)
    .pipe($.imagemin({
      optimizationLevel: config.minify.images.optimizationLxevel,
      use: [
        pngquant(config.minify.images.pngquant),
        jpegCompress({
          loops: config.minify.images.jpegCompress.loops,
          min: config.minify.images.jpegCompress.min,
          max: config.minify.images.jpegCompress.max
        })
      ],
      progressive: config.minify.images.progressive,
      interlaced: config.minify.images.interlaced
    }))
    .pipe(gulp.dest(distFiles))
    .pipe($.size({
      title: '>>> Task: minify:images - done - Image Size: '
    }));
}

module.exports = minifyImages;
