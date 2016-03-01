import config from '../../config.json';
import gulp from 'gulp';
import browserSync from 'browser-sync';


const browserSyncTask = () => {

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

  // Browser Sync
  browserSync.init([
      config.dist.markup     + '**/*.{html,php,twig}',
      config.dist.images     + '**/*.{jpg,jpeg,webp,gif,png,svg}',
      config.dist.css        + '**/*.css',
      config.dist.js         + '**/*.js'
    ],
    {
      options: {
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
      notify: {
        styles: [
          'padding: 10px 20px;',
          'position: fixed;',
          'font-size: 14px;',
          'font-weight: bold',
          'z-index: 9999;',
          'top: inherit',
          'border-radius: 0',
          'right: 0;',
          'bottom: 0;',
          'color: #f4f8f9;',
          'background-color: #026277;',
          'text-transform: uppercase'
        ]
      },
      server: bsServer,
      open: config.browsersync.openbrowser
    });
}

gulp.task('browser-sync', browserSyncTask);

module.exports = { browserSyncTask }
