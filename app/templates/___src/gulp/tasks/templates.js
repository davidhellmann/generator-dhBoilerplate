import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import errorHandler from '../lib/errorHandler';

const $ = gulpLoadPlugins()

const templates = () => {

  <% if (projectUsage == 'Prototyping' ) { %>

      return gulp
        .src(config.src.templates + '**/[^_]*.{html,twig,rss}')
        .pipe($.plumber())
        .pipe($.twig())
        .on('error', errorHandler)
        //.pipe($.changed(config.dist.markup))
        .pipe(gulp.dest(config.dist.markup));

  <% } else { %>

      return gulp
        .src(config.src.templates + '**/*.*')
        .pipe(gulp.dest(config.dist.markup));

  <% } %>

}

gulp.task('templates', templates);
module.exports = { templates }
