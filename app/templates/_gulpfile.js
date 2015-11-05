/**
 * Gulpfile
 */



/**
 * Task Vars
 */

var gulp            = require('gulp'),
    browserSync     = require('browser-sync').create(),
    runSequence     = require('run-sequence'),
    twig            = require('gulp-twig'),
    prettify        = require('gulp-prettify'),
    plumber         = require('gulp-plumber'),
    notify          = require('gulp-notify'),
    sass            = require('gulp-sass'),
    concat          = require('gulp-concat'),
    uglify          = require('gulp-uglify'),
    autoprefixer    = require('gulp-autoprefixer'),
    sourcemaps      = require('gulp-sourcemaps'),
    imagemin        = require('gulp-imagemin'),
    pngquant        = require('imagemin-pngquant'),
    jshint          = require('gulp-jshint'),
    modernizr       = require('gulp-modernizr'),
    rename          = require('gulp-rename'),
    changed         = require('gulp-changed'),
    dh              = require('./config.json'), // Get the Config Data
    del             = require('del');



/**
 * Error Handling
 */

var onError = function(err) {
    console.log(err);
}



/**
 * BrowserSync Proxy
 */

gulp.task('browser-sync', function(){
  // Build a condition when Proxy is active
  var bsProxy, bsServer;

  // Condition for Proxy
  if(dh.browsersync.proxy) {
    bsProxy = dh.browsersync.proxy;
    bsServer = false;
  } else {
    bsProxy = false;
    bsServer = { baseDir : dh.dist.browserSyncDir};
  }

  browserSync.init([
    // Files to watch
    dh.dist.markup    + '**/*.{html,php,twig}',
    dh.dist.images  + '**/*.{jpg,jpeg,webp,gif,png,svg}',
    dh.dist.css     + '**/*.css',
    dh.dist.js      + '**/*.js'],
  { options: {
      debugInfo: true,
      watchTask: true,
      proxy: bsProxy,
      ghostMode: {
        clicks : true,
        scroll : true,
        links  : true,
        forms  : true
      }
    },
    server: bsServer,
    open: dh.browsersync.openbrowser
  });
});



/**
 * Copy Fonts
 */

gulp.task('fonts', function() {
  return gulp.src(dh.src.fonts + '**/*.{ttf,woff,eof,svg,eot,woff2}')
    .pipe(gulp.dest(dh.dist.fonts))
    .pipe(notify({ message: 'Yo, Fonts task complete.' }));
});



/**
 * Image Task
 */

gulp.task('images', function() {
  return gulp.src(dh.src.images + '**/*.{png,jpeg,jpg,gif,webp,svg}')
    .pipe(plumber({
      errorHandler: onError
    }))
    .pipe(changed(dh.src.images + '**/*.{png,jpeg,jpg,gif,webp,svg}'))
    .pipe(imagemin({
      optimizationLevel: dh.minify.images.optimizationLevel,
      use: [
        pngquant(dh.minify.images.pngquant)],
      progressive:  dh.minify.images.progressive,
      svgoPlugins:  dh.minify.images.svgoPlugins,
      interlaced:   dh.minify.images.interlaced
    }))
    .pipe(gulp.dest(dh.dist.images))
    .pipe(notify({ message: 'Yo, Images task complete.' }));
});


/**
 * Move Templates Files
 */


gulp.task('templates', function(){

  <% if (projectUsage == 'Just Prototyping' || projectUsage == 'Use with Craft CMS') { %>
  return gulp.src(dh.src.templates + '*.twig')
    .pipe(plumber())
    .pipe(twig())
    .on('error', notify.onError(function (error) {
      return 'Twig Compile Error!!';
    }))
    .on('error', function(err) {
      console.log(err.message);
    })
    .pipe(prettify({
      'indent_size': 2
    }))
    .pipe(gulp.dest(dh.dist.markup))

  <% } if (projectUsage == 'Use with WordPress' ) { %>
  return gulp.src(dh.src.templates + '**/*.{html,php,twig}')
    .pipe(changed(dh.dist.markup))
    .pipe(gulp.dest(dh.dist.markup))
    .pipe(notify({ message: 'Yo, Templates task complete.' }));

  <% } %>
});


/**
 * Sass Task
 */

gulp.task('sass', function(){
  return gulp.src(dh.src.css + '*.scss')
    .pipe(plumber({
      errorHandler: onError
    }))
    .pipe(rename({ suffix: '.min'}))
    .pipe(sourcemaps.init())
      .pipe(sass({
        outputStyle: 'compressed',
        precision: 10
      }))
      .pipe(autoprefixer({
        browsers: dh.css.prefix
      }))
    .pipe(sourcemaps.write('./maps/'))
    .pipe(gulp.dest(dh.dist.css))
    .pipe(notify({ message: 'Yo, Sass task complete.' }));
});



/**
 * JS Task
 */

gulp.task('plugins', function() {
  return gulp.src(dh.files.jsCombinePlugins)
    .pipe(concat(dh.files.jsCombinePluginsFilename))
    .pipe(jshint())
    .pipe(uglify())
    .pipe(gulp.dest(dh.dist.js))
    .pipe(notify({ message: 'Yo, Plugins task complete.' }));
});

gulp.task('scripts', function() {
  return gulp.src(dh.files.jsCombineScripts)
    .pipe(plumber({
      errorHandler: onError
    }))
    .pipe(concat(dh.files.jsCombineScriptsFilename))
    .pipe(sourcemaps.init())
    .pipe(jshint())
    .pipe(uglify())
    .pipe(sourcemaps.write('./maps/'))
    .pipe(gulp.dest(dh.dist.js))
    .pipe(notify({ message: 'Yo, Scripts task complete.' }));
});


/**
 * Copy Scripts
 */

gulp.task('copy:scripts', function() {
  return gulp.src(dh.files.jsCopyThisPlugins)
    .pipe(uglify())
    .pipe(rename({ suffix: '.min'}))
    .pipe(gulp.dest(dh.dist.js + 'vendor/'))
    .pipe(notify({ message: 'Yo, Copyscripts task complete.' }));
});



/**
 * Copy System Files
 */

gulp.task('copy:systemFiles', function() {
  return gulp.src(dh.files.copySystemFiles)
    .pipe(gulp.dest(dh.dist.base))
    .pipe(notify({ message: 'Yo, System files task complete.' }));
});



/**
 * Modernizr
 */

gulp.task('modernizr', function() {
  return gulp.src([dh.src.css + '**/*.scss', dh.src.js + '**/*.js'])
    .pipe(modernizr({
      crawl:    false,
      options:  dh.modernizr.options,
      tests:    dh.modernizr.tests
    }))
    .pipe(uglify())
    .pipe(rename({ suffix: '-custom.min'}))
    .pipe(gulp.dest(dh.dist.js + 'vendor/'))
    .pipe(notify({ message: 'Yo, Modernizr task complete.' }));
});



/**
 * Init Task
 */

gulp.task('init', [
  'copy:scripts',
  'copy:systemFiles',
  'sass',
  'plugins',
  'scripts',
  'templates',
  'modernizr',
  'fonts',
  'images'
]);



/**
 * Watch Task
 */

gulp.task('watch', function() {
  // Watch Sass Files
  gulp.watch([dh.src.css + '**/*.scss'], ['sass']);

  // Watch JS Files
  gulp.watch([dh.src.js + '**/*.js'], ['scripts']);

  // Watch Template Files
  gulp.watch([dh.src.templates + '**/*.{html,php,twig}'], ['templates']);

  // If an image is modified, run our images task to compress images
  gulp.watch([dh.src.images + '**/*'], ['images']);

});



/**
 * Default Task
 */

gulp.task('default', ['browser-sync', 'watch']);


/**
 * Cleaning Tasks
 */

// Images
gulp.task('clean:images', function() {
  return del([
    dh.dist.images  + '**/*.{jpg,jpeg,webp,gif,png,svg}'
  ]);
});


// Templates
gulp.task('clean:templates', function() {
  return del([
    dh.dist.markup + '**/*.{html,php,twig}'
  ]);
});


// Fonts
gulp.task('clean:fonts', function() {
  return del([
    dh.dist.fonts + '**/*.{ttf,woff,eof,svg,eot,woff2}'
  ]);
});



/**
 * Rebuild Task
 */

gulp.task('rebuild', function(callback) {
  runSequence(
    [
      'clean:images',
      'clean:templates',
      'clean:fonts'
    ],
    [
      'images',
      'templates',
      'fonts'
    ], callback);
});