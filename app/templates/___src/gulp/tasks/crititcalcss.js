import gulp from 'gulp'
import critical from 'critical'
import yargs from 'yargs'
import config from '../../config.json'

const argv = yargs.argv

const criticalcss = () => {
  <% if (proxyUrl != false) { %>
    const localURL = 'http://' + config.browsersync.proxy
  <% } else { %>
    const localURL = 'http://localhost:3000'
  <% } %>
  const url = argv.url || localURL

  return critical.generate({
    base: config.src.templates,
    src: url,
    dest: 'critical.min.css.html',
    minify: true,
    width: 1440,
    height: 900,
    ignore: ['@font-face'],
  })
}

gulp.task('criticalcss', criticalcss);
module.exports = {criticalcss}
