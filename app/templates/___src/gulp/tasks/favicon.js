import config from '../../config.json';
import gulp from 'gulp';

const favicon = () => {
      return gulp
        .src(config.src.images.bitmap.favicon + 'favicon.ico')
        .pipe(gulp.dest(config.dist.base));
}

gulp.task('favicon', favicon);
module.exports = { favicon }
