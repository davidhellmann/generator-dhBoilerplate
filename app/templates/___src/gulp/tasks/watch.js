import config from '../../config.json';
import gulp from 'gulp';
import watch from 'gulp-watch';
import gulpLoadPlugins from 'gulp-load-plugins';

const watchTask = () => {

  // watch templates
  gulp.watch(config.src.templates + '**/*.{php,html,twig,rss}', ['templates'])

  // watch sass
  gulp.watch(config.src.css + '**/*.scss', ['sass']);
  // gulp.watch(config.src.templates + '**/*.scss', ['sass']);

  // watch images
  gulp.watch(config.src.images.bitmap.base + '**/*.{png,jpeg,jpg,gif,webp}', ['images'])

  // watch SVG Stuff
  gulp.watch(config.src.images.svg.single + '**/*', ['svg-single']);

  gulp.watch(config.src.images.svg.sprite + '**/*', ['svg-sprite']);
}

gulp.task('watch', ['browser-sync'], watchTask);
module.exports = watchTask;
