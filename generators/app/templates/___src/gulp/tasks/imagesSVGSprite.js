import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'
import pkg from '../../package.json'
import errorHandler from '../lib/errorHandler'

const $ = gulpLoadPlugins()

const vectorSource = `${pkg.src.images.svg.sprite}**/*.svg`
const vectorDist = pkg.dist.images.svg.sprite

const svgSprite = () => {
  return gulp
    .src(vectorSource)
    .pipe($.imagemin({
      svgoPlugins: pkg.minify.images.svgoPlugins
    }))
    .pipe($.svgSprite({
      shape: {
        dimension : {  // Set maximum dimensions
          maxWidth : 40,
          maxHeight : 40
        },
        spacing : { // Add padding
          padding : 0
        },
        dest : './single/'
      },
      mode: {
        symbol: {
          dest: '.',
          sprite: 'sprite.svg',
          inline: false
        }
      }
    }))
    .on('error', errorHandler)
    .pipe(gulp.dest(vectorDist))
    .pipe($.size())
    .pipe($.cheerio({
      run: function ($) {
        $('[fill^="#"]').removeAttr('fill')
        $('[fill^="none"]').removeAttr('fill')
        $('[fill-rule]').removeAttr('fill-rule')
      },
      parserOptions: { xmlMode: true }
    }))
    .pipe(gulp.dest(vectorDist))
}

gulp.task('create:svg-sprite', svgSprite)
module.exports = svgSprite
