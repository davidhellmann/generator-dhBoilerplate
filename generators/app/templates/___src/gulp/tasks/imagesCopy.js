import gulp from 'gulp'
import pkg from '../../package.json'
import copyImagesLib from '../lib/imagesCopy'

const copyImages = () => {
  copyImagesLib(`${pkg.src.images.bitmap.base}**/*.{png,jpeg,jpg,gif,webp,ico,xml,json,webapp}`, pkg.dist.images.bitmap.base)
}

gulp.task('copy:images', copyImages)
module.exports = copyImages
