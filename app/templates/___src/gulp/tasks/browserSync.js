import config from '../../config.json';
import gulp from 'gulp';
import browserSync from 'browser-sync';


const browserSyncTask = () => {
  var browserSyncWatch = [
    config.dist.markup     + '**/*.{html,php,twig}',
    config.dist.images     + '**/*.{jpg,jpeg,webp,gif,png,svg}',
    config.dist.css        + '**/*.css',
    config.dist.js         + '**/*.js'
  ];

  // Build a condition when Proxy is active
  var bsProxy, bsServer;

  // Condition for Proxy
  if(config.browsersync.proxy) {
    bsProxy = config.browsersync.proxy;
    bsServer = false;
  } else {
    bsProxy = false;
    bsServer = { baseDir : config.dist.browserSyncDir};
  }

  var browserSyncConfig = {
    proxy: bsProxy,
    server: bsServer,
    ghostMode: {
      clicks: false,
      forms: true,
      scroll: false
    },
    logLevel: 'info', // info, debug, warn, silent
    watchTask: true,
    open: config.browsersync.openbrowser,
    stream: true
  }

  browserSync.init(browserSyncWatch, browserSyncConfig);
}

gulp.task('browser-sync', browserSyncTask);

module.exports = { browserSyncTask }
