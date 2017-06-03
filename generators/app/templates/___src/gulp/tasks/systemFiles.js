import config from '../../config.json';
import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins';
import yargs from 'yargs';

const argv = yargs.argv
const $ = gulpLoadPlugins()

const systemFiles = () => {
  return gulp
    .src(config.files.systemFiles)
    .pipe( argv.source ? $.debug({ verbose: true }) : $.util.noop() )
    .pipe(gulp.dest(config.dist.base));
}

gulp.task('systemFiles', systemFiles);
module.exports = systemFiles;
