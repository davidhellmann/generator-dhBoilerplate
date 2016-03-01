/**
 * Copy Fonts
 * Copy all Fonts from the SRC to the DIST Folder.
 */

import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import errorHandler from '../lib/errorHandler';

const $ = gulpLoadPlugins()

const templates = () => {

  <% if (projectUsage == 'Prototyping' ) { %>
  return gulp
    .src(config.src.templates+ '**/*.{html,twig}')
    .pipe($.plumber())
    .pipe($.twig())
    .on('error', errorHandler)
    .pipe(gulp.dest(config.dist.markup))
    .pipe($.notify({
      onLast: true,
      message: '>>> Task: templates - done'
    }));
  <% } %>



  <% if (projectUsage == 'CraftCMS') { %>
  return gulp.src(config.src.templates + '**/*.{html,twig}')
    .pipe($.changed(config.dist.markup))
    .pipe(gulp.dest(config.dist.markup))
    .pipe($.notify({
      onLast: true,
      message: '>>> Task: templates - done'
    }));
  <% } %>



  <% if (projectUsage == 'CraftCMS') { %>
    return gulp.src(config.src.templates + '**/*.{html,php,twig,png,css,md}')
      .pipe($.changed(config.dist.markup))
      .pipe(gulp.dest(config.dist.markup))
      .pipe($.notify({
        onLast: true,
        message: '>>> Task: templates - done'
      }));
  <% } %>

}

gulp.task('templates', templates);
module.exports = { templates }
