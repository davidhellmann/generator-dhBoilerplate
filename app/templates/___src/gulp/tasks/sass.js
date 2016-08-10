import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';
import browserSync from 'browser-sync';
import errorHandler from '../lib/errorHandler';
import postCssConfig from '../lib/postCssConfig';
import yargs from 'yargs';

const argv = yargs.argv;
const $ = gulpLoadPlugins();

const compileCss = () => {
  const env = argv.env || 'development'

  return gulp
    .src(config.src.css + '**/*.scss')
    .pipe( argv.source ? $.debug({ verbose: true }) : $.util.noop() )
    .pipe(env == 'development' ? $.sourcemaps.init() : $.util.noop())
    .pipe($.rename({ suffix: '.min'}))
    .pipe($.sass({
        precision: 10,
        includePaths: [
          config.src.css + '**/*.scss'
        ]
      })
      .on('error', errorHandler))
    .pipe($.postcss(postCssConfig()))
    .pipe(env == 'development' ? $.sourcemaps.write('./maps/') : $.util.noop())
    .pipe(gulp.dest(config.dist.css))
    .pipe($.size({
      title: '>>> CSS File Size: '
    }))
    .pipe(browserSync.stream({
      match: '**/*.css'
    }));
}

gulp.task('sass', compileCss);
module.exports = compileCss;
