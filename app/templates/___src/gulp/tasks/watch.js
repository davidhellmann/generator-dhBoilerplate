import config from '../../config.json';
import gulp from 'gulp';
import watch from 'gulp-watch';
import gulpLoadPlugins from 'gulp-load-plugins';

const watchTask = () => {

  // watch templates
  gulp.watch(config.src.templates + '**/*.{php,html,twig}', ['templates'])

  // watch sass
  gulp.watch(config.src.css + '**/*.scss', ['sass']);

  // watch images
  gulp.watch(config.src.images + '**/*.{png,jpeg,jpg,gif,webp}', ['images'])

  // watch SVG Stuff
  gulp.watch(config.src.svg.single + '**/*', ['svg-single']);

  gulp.watch(config.src.svg.sprite + '**/*', ['svg-cleanup']);

  // reload!
  gulp.watch(config.src.templates + '**/*.{php,html,twig,js,jpg,png,svg}');
}

gulp.task('watch', ['browser-sync'], watchTask);
module.exports = watchTask;
