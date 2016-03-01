import config from '../../config.json'
import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()

const buildSymbolCleanupTask = () => {
  return gulp
    .src(config.dist.svg.sprite + '**/*.svg')
    .pipe($.cheerio({
      run: function ($) {
        $('[fill^="#"]').removeAttr('fill');
        $('[fill^="none"]').removeAttr('fill');
        $('[fill-rule]').removeAttr('fill-rule');
      },
      parserOptions: { xmlMode: true }
    }))
    .pipe(gulp.dest(config.dist.svg.sprite))
    .pipe($.notify({
      onLast: true,
      message: '>>> Task: svg-cleanup - done'
    }));
}

gulp.task('svg-cleanup', buildSymbolCleanupTask)
module.exports = buildSymbolCleanupTask
