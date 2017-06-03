import gulp from 'gulp'
import twig from 'gulp-twig'
import gulpLoadPlugins from 'gulp-load-plugins'
<% if (projectType === 'prototyping' ) { %>
import data from 'gulp-data'
import fs from 'fs'
import path from 'path'
<% } %>
import pkg from '../../package.json'
import errorHandler from '../lib/errorHandler'

const $ = gulpLoadPlugins()

// Overwrite the Changed Check
global.checkChanged = true

<% if (projectType === 'prototyping' ) { %>
// Work with multiple Files
var getDataMultiple = function(file) {
    const _dataFile = pkg.src.dataDir + path.basename(file.path, '.html') + '.json'
    return (fs.existsSync(_dataFile)) ? JSON.parse(fs.readFileSync(_dataFile)) : {}
}

// Work with a Single File (global.json
var getDataSingle = function(file) {
    const dataPath = pkg.src.dataFile
    return (fs.existsSync(dataPath)) ? JSON.parse(fs.readFileSync(dataPath, 'utf8')) : {};
}
<% } %>

const templates = () => {
  <% if (projectType === 'prototyping' ) { %>

      return gulp
        .src(`${pkg.src.templates}**/[^_]*.{html,twig,rss}`)
        <% if (projectType === 'prototyping' ) { %>
        .pipe(data(getDataSingle()))
        <% } %>
        .pipe($.plumber())
        .pipe(twig())
        .on('error', errorHandler)
        //.pipe($.changed(pkg.dist.markup))

        .pipe(global.checkChanged === true ? $.changed(pkg.dist.markup) : gutil.noop())
        .pipe(gulp.dest(pkg.dist.markup))

  <% } else { %>

      return gulp
        .src(`${pkg.src.templates}**/*.*`)
        .pipe(gulp.dest(pkg.dist.markup))

  <% } %>
}

gulp.task('compile:templates', templates)
module.exports = templates
