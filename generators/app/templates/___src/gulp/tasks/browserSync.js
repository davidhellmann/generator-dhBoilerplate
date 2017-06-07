import browserSync from 'browser-sync'
import gulp from 'gulp'
import yargs from 'yargs'
import pkg from '../../package.json'

const argv = yargs.argv

const browserSyncTask = () => {
    const browserSyncWatch = [
        `${pkg.dist.markup}**/*.{html,php,twig,rss}`,
        `${pkg.dist.images.base}**/*.{jpg,jpeg,webp,gif,png,svg,ico}`,
        `${pkg.dist.css}**/*.css`,
        `${pkg.dist.js}**/*.js`,
        `${pkg.dist.vue}**/*.vue`
    ];

    // Build a condition when Proxy is active
    let bsProxy, bsServer;
    const url = argv.url || pkg.browsersync.proxy

    // Condition for Proxy
    if (pkg.browsersync.proxy !== 'false') {
        bsProxy = url
        bsServer = false
    } else {
        bsProxy = false
        bsServer = {baseDir: pkg.dist.browserSyncDir}
    }

    const browserSyncConfig = {
        proxy: bsProxy,
        ghostMode: {
            clicks: true,
            forms: true,
            links: true,
            scroll: true
        },
        logLevel: 'info', // info, debug, warn, silent
        watchTask: true,
        open: pkg.browsersync.openbrowser, // false if you don't want to automatically open the browser
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

    browserSync.init(browserSyncWatch, browserSyncConfig)
}

gulp.task('browser-sync', browserSyncTask)

module.exports = browserSyncTask
