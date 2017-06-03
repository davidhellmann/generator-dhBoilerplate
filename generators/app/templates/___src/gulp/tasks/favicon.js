import config from '../../config.json'
import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()
const extension = <% if (projectUsage === 'wordpress' ) { %> '.php' <% } else { %> '.html' <% } %>

const createFavicons = () => {
    return gulp
        .src(config.src.images.bitmap.favicons + config.favicons.srcImage)
        .pipe($.favicons({
            appName: config.favicons.appName,
            appDescription: config.favicons.appDescription,
            developerName: config.favicons.developerName,
            developerURL: config.favicons.developerURL,
            background: config.favicons.background,
            path: config.dist.images.bitmap.faviconPath,
            url: config.favicons.url,
            display: config.favicons.display,
            orientation: config.favicons.orientation,
            version: config.favicons.version,
            logging: config.favicons.logging,
            online: config.favicons.online,
            icons: {
                android: config.favicons.icons.android,
                appleIcon: config.favicons.icons.appleIcon,
                appleStartup: config.favicons.icons.appleStartup,
                coast: config.favicons.icons.coast,
                favicons: config.favicons.icons.favicons,
                firefox: config.favicons.icons.firefox,
                opengraph: config.favicons.icons.opengraph,
                twitter: config.favicons.icons.twitter,
                windows: config.favicons.icons.windows,
                yandex: config.favicons.icons.yandex
            },
            html: config.src.templates + '_partials/_header/_favicons' + extension
        }))
        .pipe(gulp.dest(config.src.images.bitmap.favicons))
}

gulp.task('createFavicons', createFavicons)
module.exports = {createFavicons}
