import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'
import pngquant from 'imagemin-pngquant'
import jpegCompress from 'imagemin-jpeg-recompress'
import pkg from '../../package.json'

const $ = gulpLoadPlugins()

const minifyImages = (srcFiles, distFiles) => {
  return gulp
    .src(srcFiles)
    .pipe($.imagemin({
      optimizationLevel: pkg.minify.images.optimizationLxevel,
      use: [
        pngquant(pkg.minify.images.pngquant),
        jpegCompress({
          loops: pkg.minify.images.jpegCompress.loops,
          min: pkg.minify.images.jpegCompress.min,
          max: pkg.minify.images.jpegCompress.max
        })
      ],
      progressive: pkg.minify.images.progressive,
      interlaced: pkg.minify.images.interlaced
    }))
    .pipe(gulp.dest(distFiles))
    .pipe($.size({
      title: '>>> Task: minify:images - done - Image Size: '
    }));
}

module.exports = minifyImages
