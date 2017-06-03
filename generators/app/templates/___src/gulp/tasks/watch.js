import gulp from 'gulp'
import pkg from '../../package.json'

const watchTask = () => {

  // watch templates
  gulp.watch(`${pkg.src.templates}**/*.{php,html,twig,rss}`, ['compile:templates'])


  <% if (projectType === 'prototyping' ) { %>
  // watch JSON
  gulp.watch(`${pkg.src.dataDir}**/*.json`, ['compile:templates'])
  <% } %>

  // watch sass
  gulp.watch(`${pkg.src.css}**/*.scss`, ['compile:css'])
  gulp.watch(`${pkg.src.templates}**/*.scss`, ['compile:css'])

  // watch images
  gulp.watch(`${pkg.src.images.bitmap.base}**/*.{png,jpeg,jpg,gif,webp}`, ['copy:images'])

  // watch SVG Stuff
  gulp.watch(`${pkg.src.images.svg.single}**/*`, ['copy:svg-single'])

  gulp.watch(`${pkg.src.images.svg.sprite}**/*`, ['create:svg-sprite'])
}

gulp.task('watch', ['browser-sync'], watchTask)
module.exports = watchTask
