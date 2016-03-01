import config from '../../config.json';
import gulp from 'gulp';
import del from 'del';

var directoryToClean;

gulp.task('clean:dist', function (cb) {
  return del([
    config.dist.markup + '**/*'
  ], {
    force: true
  }, cb);
});

gulp.task('clean:templates', function (cb) {
  return del([
    config.dist.templates + '**/*.{php,html,twig}'
  ], {
    force: true
  }, cb);
});

gulp.task('clean:images', function (cb) {
  return del([
    config.dist.images + '**/*.{jpeg,jpg,gif,png,webp,svg}'
  ], {
    force: true
  }, cb);
});

gulp.task('clean:js', function (cb) {
  return del([
    config.dist.js + '**/*'
  ], {
    force: true
  }, cb);
});

gulp.task('clean:css', function (cb) {
  return del([
    config.dist.css + '**/*'
  ], {
    force: true
  }, cb);
});
