import gulp from 'gulp'
import pkg from '../../package.json'
import minifyImages from '../lib/imagesMinify'

const minifyImagesTask = () => {
  minifyImages(`${pkg.dist.images.bitmap.base}**/*.{png,jpeg,jpg,gif,webp,ico}`, pkg.dist.images.bitmap.base)
}

gulp.task('minify:images', minifyImagesTask)
module.exports = minifyImagesTask
