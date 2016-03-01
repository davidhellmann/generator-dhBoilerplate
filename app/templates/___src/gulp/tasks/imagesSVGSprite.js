import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import errorHandler from '../lib/errorHandler';
import copyImages from '../lib/imagesCopy';

const $ = gulpLoadPlugins();

const vectorSource = config.src.svg.sprite + '**/*.svg';
const vectorDist = config.dist.svg.sprite;

const svgSprite = () => {
  return gulp
    .src(vectorSource)
    .pipe($.changed(vectorDist))
    .pipe($.imagemin({
      svgoPlugins: config.minify.images.svgoPlugins
    }))
    .pipe($.svgSprite({
      mode: {
        symbol: {
          dest: '.',
          sprite: 'sprite.svg',
          inline: true
        }
      }
    }))
    .on('error', errorHandler)
    .pipe(gulp.dest(vectorDist))
    .pipe($.size())
    .pipe($.notify({
      onLast: true,
      message: '>>> Task: svg-sprite - done'
    }));
}

gulp.task('svg-sprite', svgSprite);
module.exports = svgSprite;
