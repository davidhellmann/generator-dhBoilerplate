import config from '../../config.json';
import gulp from 'gulp';
import twig from 'gulp-twig'
import gulpLoadPlugins from 'gulp-load-plugins';
import errorHandler from '../lib/errorHandler';
<% if (projectUsage == 'Prototyping' ) { %>
import data from 'gulp-data'
import fs from 'fs'
import path from 'path'
<% } %>

const $ = gulpLoadPlugins()

// Overwrite the Changed Check
global.checkChanged = true

<% if (projectUsage == 'Prototyping' ) { %>
// Work with multiple Files
var getDataMultiple = function(file) {
    const _dataFile = config.src.dataDir + path.basename(file.path, '.html') + '.json'
    return (fs.existsSync(_dataFile)) ? JSON.parse(fs.readFileSync(_dataFile)) : {}
}

// Work with a Single File (global.json
var getDataSingle = function(file) {
    const dataPath = config.src.dataFile
    return (fs.existsSync(dataPath)) ? JSON.parse(fs.readFileSync(dataPath, 'utf8')) : {};
}
<% } %>


const templates = () => {

  <% if (projectUsage == 'Prototyping' ) { %>

      return gulp
        .src(config.src.templates + '**/[^_]*.{html,twig,rss}')
        <% if (projectUsage == 'Prototyping' ) { %>
        .pipe(data(getDataSingle()))
        <% } %>
        .pipe($.plumber())
        .pipe(twig())
        .on('error', errorHandler)
        //.pipe($.changed(config.dist.markup))

        .pipe(global.checkChanged === true ? $.changed(config.dist.markup) : gutil.noop())
        .pipe(gulp.dest(config.dist.markup));

  <% } else { %>

      return gulp
        .src(config.src.templates + '**/*.*')
        .pipe(gulp.dest(config.dist.markup));

  <% } %>

}

gulp.task('templates', templates);
module.exports = { templates }
