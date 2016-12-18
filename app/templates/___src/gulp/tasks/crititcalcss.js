import config from '../../config.json'
import gulp from 'gulp'
import critical from 'critical'


const criticalcss = () => {
  return critical.generate({
    base: config.src.templates,
    src: '<%= proxyUrl %>',
    dest: 'critical.min.css.html',
    minify: true,
    width: 1440,
    height: 900,
    ignore: ['font-face'],
  })
}

gulp.task('criticalcss', criticalcss);
module.exports = {criticalcss}
