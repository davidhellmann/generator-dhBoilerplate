import config from '../../config.json';
import gulp from 'gulp';
import gulpLoadPlugins from 'gulp-load-plugins';


const $ = gulpLoadPlugins();

const combinemq = () => {

    return gulp
        .src(config.dist.css + '**/*.css')
        .pipe($.size({
            title: 'Styles before media queries combination.'
        }))
        .pipe($.combineMq({
            beautify: false
        }))
        .pipe(gulp.dest(config.dist.css))
        .pipe($.notify('combined Media Queries'))
        .pipe($.size({
            title: 'Styles after media queries combination.'
        }))
}

gulp.task('combinemq:sass', combinemq);
module.exports = combinemq;
