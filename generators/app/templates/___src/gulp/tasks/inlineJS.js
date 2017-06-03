import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'
import pgk from '../../package.json'
const $ = gulpLoadPlugins()

const inlineJS = () => {
    return gulp
        .src(pgk.inlineJS)
        .pipe($.uglify())
        .pipe($.rename({ suffix: '.min'}))
        .pipe(gulp.dest(`${pgk.dist.markup}_inlineJS/`))
}

gulp.task('create:inlineJS', inlineJS)
module.exports = inlineJS
