import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'
import yargs from 'yargs'
import pkg from '../../package.json'

const argv = yargs.argv
const $ = gulpLoadPlugins()

const systemFiles = () => {
    return gulp
        .src(pkg.files.systemFiles)
        .pipe(argv.source ? $.debug({verbose: true}) : $.util.noop())
        .pipe(gulp.dest(pkg.dist.base))
}

gulp.task('copy:systemFiles', systemFiles)
module.exports = systemFiles
