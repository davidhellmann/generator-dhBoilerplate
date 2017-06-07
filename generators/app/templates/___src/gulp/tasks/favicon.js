import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'
import pkg from '../../package.json'

const $ = gulpLoadPlugins()
const extension = <% if (projectType === 'wordpress' ) { %> '.php' <% } else { %> '.html' <% } %>

const createFavicons = () => {
    return gulp
        .src(pkg.src.images.bitmap.favicons + pkg.favicons.srcImage)
        .pipe($.favicons({
            appName: pkg.favicons.appName,
            appDescription: pkg.favicons.appDescription,
            developerName: pkg.favicons.developerName,
            developerURL: pkg.favicons.developerURL,
            background: pkg.favicons.background,
            path: pkg.dist.images.bitmap.faviconPath,
            url: pkg.favicons.url,
            display: pkg.favicons.display,
            orientation: pkg.favicons.orientation,
            version: pkg.favicons.version,
            logging: pkg.favicons.logging,
            online: pkg.favicons.online,
            icons: {
                android: pkg.favicons.icons.android,
                appleIcon: pkg.favicons.icons.appleIcon,
                appleStartup: pkg.favicons.icons.appleStartup,
                coast: pkg.favicons.icons.coast,
                favicons: pkg.favicons.icons.favicons,
                firefox: pkg.favicons.icons.firefox,
                opengraph: pkg.favicons.icons.opengraph,
                twitter: pkg.favicons.icons.twitter,
                windows: pkg.favicons.icons.windows,
                yandex: pkg.favicons.icons.yandex
            },
            html: pkg.src.templates + '_partials/_header/_favicons' + extension
        }))
        .pipe(gulp.dest(pkg.src.images.bitmap.favicons))
}

gulp.task('create:favicons', createFavicons)
module.exports = createFavicons
