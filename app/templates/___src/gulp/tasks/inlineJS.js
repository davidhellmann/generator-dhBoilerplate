import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins'
const $ = gulpLoadPlugins()

const inlineJS = () => {
    return gulp
        .src(config.inlineJs)
        .pipe($.uglify())
        .pipe($.rename({ suffix: '.min'}))
        .pipe(gulp.dest(config.dist.markup + '_inlineJS/'));
}

gulp.task('inlineJS', inlineJS);
module.exports = { inlineJS }
