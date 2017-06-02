import config from '../../config.json';
import gulp from 'gulp';
import yargs from 'yargs'
import browserSync from 'browser-sync';

const argv = yargs.argv

const browserSyncTask = () => {
  var browserSyncWatch = [
    config.dist.markup          + '**/*.{html,php,twig,rss}',
    config.dist.images.base     + '**/*.{jpg,jpeg,webp,gif,png,svg,ico}',
    config.dist.css             + '**/*.css',
    config.dist.js              + '**/*.js',
    config.dist.js              + '**/*.vue'
    /*
    <% if (projectVue == false ) { %>
    config.dist.js         + '**!/!*.js'
    <% } %>
    */
  ];

  // Build a condition when Proxy is active
  var bsProxy, bsServer;
  const url = argv.url || config.browsersync.proxy;

  // Condition for Proxy
  if( config.browsersync.proxy ) {
    bsProxy = url;
    bsServer = false;
  } else {
    bsProxy = false;
    bsServer = { baseDir : config.dist.browserSyncDir};
  }

  var browserSyncConfig = {
    proxy: bsProxy,
    ghostMode: {
      clicks: true,
      forms: true,
      links: true,
      scroll: true
    },
    logLevel: 'info', // info, debug, warn, silent
    watchTask: true,
    open: config.browsersync.openbrowser, // false if you don't want to automatically open the browser
    server: bsServer,
    stream: true,
    notify: {
      styles: [
        'padding: 10px 20px;',
        'font-family: arial;',
        'line-height: 1',
        'position: fixed;',
        'font-size: 10px;',
        'font-weight: bold',
        'z-index: 9999;',
        'top: inherit',
        'border-radius: 0',
        'right: 0;',
        'bottom: 0;',
        'color: #fff;',
        'background-color: rgba(0,0,0, .5)',
        'text-transform: uppercase'
      ]
    }
  }

  browserSync.init(browserSyncWatch, browserSyncConfig);
}

gulp.task('browser-sync', browserSyncTask);

module.exports = { browserSyncTask }
